import 'dart:async';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_manager.g.dart';

@Riverpod(dependencies: [userDetails])
class SessionManager extends _$SessionManager {
  static const heartbeatInterval = Duration(minutes: 1);
  static const idleTimeout = Duration(minutes: 15);
  Timer? _heartbeatTimer;
  Timer? _idleTimer;
  Session? _currentSession;

  bool _starting = false;
  @override
  FutureOr<void> build() async {
    ref.onDispose(() {
      _stopHeartbeat();
    });
  }

  bool get isActive => _currentSession != null && _heartbeatTimer != null;

  Future<void> _startHeartbeat() async {
    if (_starting || isActive) return;
    _starting = true;
    try {
      final user = await ref.read(userDetailsProvider.future);
      final db = ref.read(databaseAPIProvider);
      final cutoffIso = DateTime.now().toUtc().subtract(idleTimeout).toIso8601String();
      final sessions = await db.query(
        document: listSessionsGraphQL,
        variables: {
          'filter': {
            'staffId': {'eq': user.id},
            'updatedAt': {
              'ge': cutoffIso,
            }
          },
          'limit': 1,
        },
      ).then((res) {
        return (res['listSessions']['items'] as List)
            .map((e) => Session.fromJson(e))
            .toList();
      });
      final lastSession = sessions.firstOrNull;
      if (lastSession == null) {
        _currentSession = Session(staff: user);
        await db.create(_currentSession!);
      } else {
        _currentSession = lastSession;
        await db.update(_currentSession!);
      }
      _heartbeatTimer = Timer.periodic(
        heartbeatInterval,
        (timer) async {
          if (_currentSession != null) {
            await db.update(_currentSession!);
          }
        },
      );

      _resetIdleTimer();
    } catch (e) {
      _stopHeartbeat();
    } finally {
      _starting = false;
    }
  }

  void markUserActive() {
    if (!isActive) {
      _startHeartbeat().catchError((_) => _stopHeartbeat());
    }
    _resetIdleTimer();
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(idleTimeout, () {
      _stopHeartbeat();
    });
  }

  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _idleTimer?.cancel();
    _heartbeatTimer = null;
    _idleTimer = null;
    _currentSession = null;
  }
}

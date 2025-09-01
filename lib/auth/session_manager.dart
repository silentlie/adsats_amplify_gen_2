import 'dart:async';

import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_manager.g.dart';

@Riverpod(dependencies: [userDetails])
class SessionManager extends _$SessionManager {
  Timer? _heartbeatTimer;
  Session? _currentSession;

  @override
  FutureOr<void> build() async {
    // Clean up when the provider is disposed
    ref.onDispose(() {
      _stopHeartbeat();
    });
    // Start the heartbeat session
    await _startHeartbeat();
  }

  Future<void> _startHeartbeat() async {
    try {
      // Get current user UUID
      final user = await ref.read(userDetailsProvider.future);
      // Create new session
      // TODO: Fetch old session in past five minutes instead create
      _currentSession = Session(
        staff: user,
      );
      final db = ref.read(databaseAPIProvider);
      // Save initial session
      await db.create(_currentSession!);
      // Start periodic updates
      _heartbeatTimer =
          Timer.periodic(const Duration(minutes: 1), (timer) async {
        if (_currentSession != null) {
          await db.update(_currentSession!);
        }
      });
    } catch (e) {
      _stopHeartbeat();
    }
  }

  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _currentSession = null;
  }
}

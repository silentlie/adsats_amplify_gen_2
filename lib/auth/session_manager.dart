import 'dart:async';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_manager.g.dart';

@Riverpod(dependencies: [userId])
class SessionManager extends _$SessionManager {
  Timer? _heartbeatTimer;
  dynamic _currentSession;

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
      final currentUserUuid = await ref.watch(userIdProvider.future);

      // Create new session
      final sessionId = uuid();
      // _currentSession = Session(
      //   id: sessionId,
      //   userId: currentUserUuid,
      //   startAt: TemporalDateTime.now(),
      // );

      // Save initial session
      // await create(_currentSession!);

      // Start periodic updates
      // _heartbeatTimer =
      //     Timer.periodic(const Duration(seconds: 5), (timer) async {
      //   if (_currentSession != null) {
      //     await update(_currentSession!.copyWith(
      //       endAt: TemporalDateTime.now(),
      //     ));
      //   }
      // });
    } catch (e) {
      // Handle errors appropriately
      _stopHeartbeat();
      rethrow;
    }
  }

  Future<void> _updateSession() async {
    if (_currentSession != null) {
      try {

      } catch (e) {
        // Handle update errors
        _stopHeartbeat();
      }
    }
  }

  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _currentSession = null;
  }
}

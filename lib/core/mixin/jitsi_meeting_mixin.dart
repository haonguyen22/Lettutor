import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';

mixin JistiMeetingMixin<T extends StatefulWidget> on State<T> {
  User? get currentUser => context.read<AuthBloc>().state.user;

  void onTapEnterLessonRoom(String? url) async {
    final meetingToken = url?.split('token=')[1];
    if (meetingToken?.isNotEmpty ?? false) {
      Map<String, Object> featureFlags = {};
      try {
        var options = JitsiMeetingOptions(
          roomNameOrUrl: "learningRoom",
          serverUrl: "https://meet.lettutor.com",
          // subject: subjectText.text,
          token: meetingToken,
          isAudioMuted: true,
          isAudioOnly: true,
          isVideoMuted: true,
          userDisplayName: currentUser?.name,
          userEmail: currentUser?.email,
          userAvatarUrl: currentUser?.avatar,
          featureFlags: featureFlags,
        );

        await JitsiMeetWrapper.joinMeeting(options: options);
      } catch (e) {
        log("🐛[Exception] ${e.toString()}");
        // print('Error: $e');
      }
    }
  }
}

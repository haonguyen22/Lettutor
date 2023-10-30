import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/data/models/tutor/become_tutor_request.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/become_tutor/bloc/become_tutor_bloc.dart';
import 'package:let_tutor/presentation/become_tutor/views/complete_profile_step.dart';
import 'package:let_tutor/presentation/become_tutor/views/video_introduction_step.dart';
import 'package:localization/generated/l10n.dart';

class BecomeTutorScreen extends StatefulWidget {
  const BecomeTutorScreen({super.key});

  @override
  State<BecomeTutorScreen> createState() => _BecomeTutorScreenState();
}

class _BecomeTutorScreenState extends State<BecomeTutorScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).becomeATutor),
        backgroundColor: context.primaryColor.withOpacity(0.4),
      ),
      body: Stepper(
        currentStep: _index,
        controlsBuilder: (context, details) {
          return Row(
            children: [
              if (_index == 0)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index += 1;
                    });
                  },
                  child: Text(S.of(context).Continue),
                ),
              if (_index == 1)
                ElevatedButton(
                  onPressed: () {
                    final user = context.read<AuthBloc>().state.user;
                    context.read<BecomeTutorBloc>().add(BecomeTutor(
                          becomeTutorRequest:
                              BecomeTutorRequest(avatar: user?.avatar,),
                        ));
                  },
                  child: Text(S.of(context).done),
                ),
              if (_index == 2)
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).backHome),
                ),
              const SizedBox(width: 10),
              if (_index < 2)
                ElevatedButton(
                  onPressed: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  child: Text(S.of(context).cancel),
                ),
            ],
          );
        },
        onStepTapped: (value) {
          setState(() {
            _index = value;
          });
        },
        steps: <Step>[
          Step(
            title: Text(S.of(context).completeProfile),
            content: const CompleteProfileStepScreen(),
          ),
          Step(
            title: Text(S.of(context).videoIntrodution),
            content: const VideoIntroductionStep(),
          ),
          Step(
            title: Text(S.of(context).approval),
            content: Column(
              children: [
                Text(
                  S.of(context).doneAllSteps,
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).waitForApproval,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

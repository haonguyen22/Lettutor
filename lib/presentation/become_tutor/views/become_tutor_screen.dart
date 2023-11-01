import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/data/models/tutor/become_tutor_request.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/become_tutor/bloc/become_tutor_bloc.dart';
import 'package:let_tutor/presentation/become_tutor/views/complete_profile_step.dart';
import 'package:let_tutor/presentation/become_tutor/views/video_introduction_step.dart';
import 'package:let_tutor/presentation/become_tutor/views/waiting_approval.dart';
import 'package:localization/generated/l10n.dart';

class BecomeTutorScreen extends StatefulWidget {
  const BecomeTutorScreen({super.key});

  @override
  State<BecomeTutorScreen> createState() => _BecomeTutorScreenState();
}

class _BecomeTutorScreenState extends State<BecomeTutorScreen> {
  int _index = 0;

  void onNextStep() {
    setState(() {
      _index += 1;
    });
  }

  void onTapDone() {
    final user = context.read<AuthBloc>().state.user;
    context.read<BecomeTutorBloc>().add(BecomeTutor(
          becomeTutorRequest: BecomeTutorRequest(
            avatar: user?.avatar,
          ),
        ));
    setState(() {
      _index += 1;
    });
  }

  void onBackStep() {
    if (_index > 0) {
      setState(() {
        _index -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).becomeATutor),
        backgroundColor: context.primaryColor.withOpacity(0.4),
      ),
      body: Column(
        children: [
          NumberStepper(
            numbers: const [1, 2, 3],

            // activeStep property set to activeStep variable defined above.
            activeStep: _index,
            enableNextPreviousButtons: false,
            enableStepTapping: false,

            // This ensures step-tapping updates the activeStep.
            onStepReached: (index) {
              setState(() {
                _index = index;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: renderBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderBody() {
    switch (_index) {
      case 0:
        return CompleteProfileStepScreen(
          onNext: onNextStep,
        );
      case 1:
        return VideoIntroductionStep(
          onDone: onTapDone,
          onCancel: onBackStep,
        );
      default:
        return WaitingApprovalStep(
          onBackHome: () => Navigator.of(context).pop(),
        );
    }
  }
}

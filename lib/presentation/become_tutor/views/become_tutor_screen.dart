import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/data/models/tutor/become_tutor_data.dart';
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
  BecomeTutorBloc get becomeTutorBloc => context.read<BecomeTutorBloc>();
  int _index = 0;

  void onNextStep(BecomeTutorData becomeTutorData) {
    becomeTutorBloc
        .add(UpdateInformationEvent(becomeTutorData: becomeTutorData));
    setState(() {
      _index += 1;
    });
  }

  void onTapDone() {
    context.read<BecomeTutorBloc>().add(const SendBecomeTutorEvent());
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
    return BlocConsumer<BecomeTutorBloc, BecomeTutorState>(
      listener: (_, state) {
        if (state is BecomeTutorSuccess) {
          setState(() {
            _index += 1;
          });
        }
        if (state is BecomeTutorFailure) {
          setState(() {
            _index += 1;
          });
        }
      },
      buildWhen: (previous, current) => current != previous,
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).becomeATutor),
          backgroundColor: context.primaryColor.withOpacity(0.4),
        ),
        body: Column(
          children: [
            NumberStepper(
              numbers: const [1, 2, 3],
              activeStep: _index,
              enableNextPreviousButtons: false,
              enableStepTapping: false,
              stepColor: context.primaryColor.withOpacity(0.2),
              activeStepColor: context.primaryColor,
              onStepReached: (index) {
                setState(() {
                  _index = index;
                });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: renderBody(state),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderBody(BecomeTutorState state) {
    switch (_index) {
      case 0:
        return CompleteProfileStepScreen(
          onNext: onNextStep,
        );
      case 1:
        return VideoIntroductionStep(
          onDone: onTapDone,
          onCancel: onBackStep,
          onVideoSelected: (file) {
            context.read<BecomeTutorBloc>().add(
                  UpdateInformationEvent(
                    becomeTutorData: BecomeTutorData(
                      video: file?.path ?? "",
                    ),
                  ),
                );
            setState(() {});
          },
          galleryFile: state.becomeTutorData?.video?.split('/').last,
        );
      default:
        return WaitingApprovalStep(
          onBackHome: () => Navigator.of(context).pop(),
        );
    }
  }
}

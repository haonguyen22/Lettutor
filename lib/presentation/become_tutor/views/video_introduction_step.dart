import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/mixin/image_picker_mixin.dart';
import 'package:let_tutor/core/widget/divider_label.dart';
import 'package:let_tutor/presentation/become_tutor/bloc/become_tutor_bloc.dart';
import 'package:localization/generated/l10n.dart';

class VideoIntroductionStep extends StatefulWidget {
  final String? galleryFile;
  final VoidCallback onCancel, onDone;
  final Function(File? file)? onVideoSelected;

  const VideoIntroductionStep({
    super.key,
    this.galleryFile,
    this.onVideoSelected,
    required this.onCancel,
    required this.onDone,
  });

  @override
  State<VideoIntroductionStep> createState() => _VideoIntroductionStepState();
}

class _VideoIntroductionStepState extends State<VideoIntroductionStep>
    with ImagePickerMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BecomeTutorBloc, BecomeTutorState>(
      builder: (_, state) => Column(
        children: [
          Text(
            S.of(context).introdutionYourself,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).introductionYourselfDesc,
            style: context.textTheme.bodyLarge,
          ),
          DividerLabelWidget(label: S.of(context).videoIntroduction),
          ElevatedButton(
            onPressed: () {
              showVideoPicker(onVideoSelected: (file) {
                widget.onVideoSelected?.call(file);
              });
            },
            child: Text(S.of(context).chooseVideo),
          ),
          const SizedBox(height: 16),
          if (widget.galleryFile != null)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: context.textColor!.withOpacity(0.6)),
                ),
                margin: const EdgeInsetsDirectional.only(bottom: 8),
                constraints: const BoxConstraints(minWidth: 200, maxWidth: 400),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.video_collection_outlined),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.galleryFile!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 12),
          if (widget.galleryFile == null)
            Align(
              alignment: Alignment.center,
              child: Text(
                S.of(context).pleaseInputVideo,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          const SizedBox(height: 12),
          SizedBox(
            width: context.widthDevice,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: widget.galleryFile != null
                          ? widget.onDone
                          : () {
                              context.showSnackBar(
                                message: S.of(context).pleaseInputVideo,
                                color: Colors.red,
                              );
                            },
                      child: state is BecomeTutorLoading
                          ? const CircularProgressIndicator()
                          : Text(S.of(context).done),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      onPressed: widget.onCancel,
                      child: Text(
                        S.of(context).cancel,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

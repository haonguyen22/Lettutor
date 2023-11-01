import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:localization/generated/l10n.dart';

class VideoIntroductionStep extends StatefulWidget {
  final File? galleryFile;
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

class _VideoIntroductionStepState extends State<VideoIntroductionStep> {
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              S.of(context).videoIntroduction,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            _showPicker(context: context);
          },
          child: Text(S.of(context).chooseVideo),
        ),
        const SizedBox(height: 8),
        if (widget.galleryFile != null)
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: context.textColor!.withOpacity(0.6)),
              ),
              margin: const EdgeInsetsDirectional.only(bottom: 8),
              width: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.video_collection_outlined),
                  Expanded(
                    child: Text(
                      widget.galleryFile!.path.split('/').last,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: widget.onDone,
                    child: Text(S.of(context).done),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: widget.onCancel,
                    child: Text(
                      S.of(context).cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  getVideo(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getVideo(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getVideo(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickVideo(
        source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          widget.onVideoSelected!(File(pickedFile!.path));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              SnackBar(content: Text(S.of(context).nothingSelect)));
        }
      },
    );
  }
}

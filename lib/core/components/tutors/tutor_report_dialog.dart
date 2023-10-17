import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/domain/entities/tutor.dart';
import 'package:localization/localization.dart';

class TutorReportDialog extends StatefulWidget {
  final Tutor? tutor;
  final TextEditingController controller;
  const TutorReportDialog({
    this.tutor,
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TutorReportDialog> createState() => _TutorReportDialogState();
}

class _TutorReportDialogState extends State<TutorReportDialog> {
  final List<bool> _choices = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final contents = [
      S.of(context).tutorAnnoyMe,
      S.of(context).profilePretendingOrFake,
      S.of(context).inappropriatePhoto,
    ];
    return AlertDialog(
      title: Text(
        S
            .of(context)
            .reportTutor(widget.tutor?.name ?? widget.tutor?.user?.name ?? ""),
        style: context.textTheme.headlineSmall,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                color: context.primaryColor,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  S.of(context).helpUsToUnderstand,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          ...List<Widget>.generate(_choices.length, (index) {
            return Row(
              children: [
                Checkbox(
                  value: _choices[index],
                  onChanged: (value) {
                    setState(() {
                      _choices[index] = value!;
                    });
                  },
                ),
                Expanded(child: Text(contents[index])),
              ],
            );
          }),
          const SizedBox(height: 16),
          TextField(
            controller: widget.controller,
            minLines: 2,
            maxLines: 2,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: S.of(context).letUsKnowDetailsYourProblem,
              hintStyle: context.textTheme.bodySmall
                  ?.copyWith(color: context.textColor?.withOpacity(0.6)),
              contentPadding: const EdgeInsets.all(12),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(
            S.of(context).cancel,
            style: context.textTheme.bodyLarge,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(
            S.of(context).submit,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

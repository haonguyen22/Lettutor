import 'dart:async';

import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/mixin/jitsi_meeting_mixin.dart';
import 'package:localization/generated/l10n.dart';

class CountDownScreen extends StatefulWidget {
  const CountDownScreen({
    Key? key,
    required this.startTimestamp,
    required this.url,
  }) : super(key: key);

  final int startTimestamp;
  final String url;

  @override
  State<CountDownScreen> createState() => _CountDownScreenState();
}

class _CountDownScreenState extends State<CountDownScreen>
    with JistiMeetingMixin {
  late Timer _timer;
  late Duration _currentTime;

  void _startTimer() {
    _currentTime = DateTime.fromMillisecondsSinceEpoch(widget.startTimestamp)
        .difference(DateTime.now());

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_currentTime.inSeconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _currentTime =
                DateTime.fromMillisecondsSinceEpoch(widget.startTimestamp)
                    .difference(DateTime.now());
          });
        }
      },
    );
  }

  String _convertWaitingTime() {
    final days = (_currentTime.inDays).toString().padLeft(2, '0');
    final hours = (_currentTime.inHours % (7)).toString().padLeft(2, '0');
    final minutes = (_currentTime.inMinutes % (24)).toString().padLeft(2, '0');
    final seconds = (_currentTime.inSeconds % (60)).toString().padLeft(2, '0');
    return '$days:$hours:$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    if (mounted) _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.primaryColor,
                    ),
                    child: Text(
                      S.of(context).joinNow,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      onTapEnterLessonRoom(
                        widget.url,
                        widget.startTimestamp,
                        isMeetingNow: true,
                      );
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).lessonStartIn(_convertWaitingTime()),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.white60),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

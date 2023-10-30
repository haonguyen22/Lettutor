import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/presentation/schedule/history/views/history_tab_view.dart';
import 'package:let_tutor/presentation/schedule/upcoming/views/upcoming_tab_view.dart';
import 'package:localization/generated/l10n.dart';

class ScheduleTabView extends StatelessWidget {
  const ScheduleTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: context.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: context.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).upcoming,
                        style: TextStyle(color: context.primaryColor),
                      )
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history_outlined,
                        color: context.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        S.of(context).history,
                        style: TextStyle(color: context.primaryColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  UpcomingTabView(),
                  HistoryTabView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

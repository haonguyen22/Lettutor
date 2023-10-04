import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/presentation/auth/widgets/icon_language.dart';
import 'package:let_tutor/presentation/home/view/tab/courses_tab_view.dart';
import 'package:let_tutor/presentation/home/view/tab/home_tab_view.dart';
import 'package:let_tutor/presentation/home/view/tab/schedule_tab_view.dart';
import 'package:let_tutor/presentation/home/view/tab/settings_tab_view.dart';
import 'package:let_tutor/presentation/home/view/tab/tutor_tab_view.dart';
import 'package:let_tutor/core/widget/logo_icon.dart';
import 'package:localization/generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final bottomNavigationItems = [
      {
        "icon": const Icon(Icons.home),
        "label": S.of(context).home,
        "view": const HomeTabView(),
      },
      {
        "icon": const Icon(Icons.person),
        "label": S.of(context).tutors,
        "view": const TutorTabView(),
      },
      {
        "icon": const Icon(Icons.layers),
        "label": S.of(context).courses,
        "view": const CoursesTabView(),
      },
      {
        "icon": const Icon(Icons.calendar_month_outlined),
        "label": S.of(context).schedule,
        "view": const ScheduleTabView(),
      },
      {
        "icon": const Icon(Icons.settings),
        "label": S.of(context).settings,
        "view": const SettingsTabView(),
      }
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const LogoAppWidget(),
        leadingWidth: 150,
        backgroundColor: context.backgroundColor,
        actions: const [IconLanguageWidget()],
      ),
      body: ValueListenableBuilder(
        valueListenable: _index,
        builder: (_, value, __) {
          return bottomNavigationItems[value]['view'] as Widget;
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _index,
        builder: (_, index, __) => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (int index) {
            _index.value = index;
          },
          destinations: List.generate(
            bottomNavigationItems.length,
            (i) => NavigationDestination(
              icon: bottomNavigationItems[i]['icon'] as Widget,
              label: bottomNavigationItems[i]['label'] as String,
            ),
          ),
        ),
      ),
    );
  }
}

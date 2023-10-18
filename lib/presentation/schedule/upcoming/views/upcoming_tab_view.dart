import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/schedule/upcoming/views/upcoming_card.dart';
import 'package:localization/localization.dart';

class UpcomingTabView extends StatefulWidget {
  const UpcomingTabView({super.key});

  @override
  State<UpcomingTabView> createState() => _UpcomingTabViewState();
}

class _UpcomingTabViewState extends State<UpcomingTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            S.of(context).bookNumClasses(3),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          ...List<Widget>.generate(
            3,
            (index) => UpcomingCardWidget(
              name: "ab",
              date: DateTime(2021, 3, 3),
              imageUrl:
                  "https://api.app.lettutor.com/avatar/7f663cef-2529-4f01-9c25-e71300727b56avatar1686546526450.jpg",
              timeRange: "8:00 - 15:00",
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

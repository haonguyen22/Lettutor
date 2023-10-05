import 'package:flutter/material.dart';
import 'package:let_tutor/core/components/courses/course_card.dart';
import 'package:localization/generated/l10n.dart';

class CoursesTabView extends StatefulWidget {
  const CoursesTabView({super.key});

  @override
  State<CoursesTabView> createState() => _CoursesTabViewState();
}

class _CoursesTabViewState extends State<CoursesTabView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final TextEditingController _search;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _search = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: S.of(context).search,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                controller: _search,
              ),
              const SizedBox(height: 10),
              ...List.generate(
                5,
                (i) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CourseCardWidget(
                    name: 'abc',
                    imageUrl:
                        "https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e",
                    description:
                        "You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.",
                    level: "Intermediate",
                    numOfLesson: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

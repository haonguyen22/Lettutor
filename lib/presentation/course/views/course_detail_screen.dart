import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/column_info_detail.dart';
import 'package:let_tutor/core/widget/custom_card.dart';
import 'package:let_tutor/presentation/course/views/course_topic_detail_screen.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';

class CourseDetailScreen extends StatefulWidget {
  final String name, imageUrl, reason, purpose, description;
  final List? topics;

  const CourseDetailScreen({
    super.key,
    this.name = "IELTS Speaking Part 1",
    this.imageUrl =
        "https://camblycurriculumicons.s3.amazonaws.com/5e2b9a72db0da5490226b6b5?h=d41d8cd98f00b204e9800998ecf8427e",
    this.reason =
        "Feeling confident answering Part 1 questions will help you get off to a strong start on your IELTS speaking exam.",
    this.purpose =
        "You'll practice giving strong answers in Part 1, with tips and tricks recommended by real IELTS examiners. ",
    this.description =
        "Practice answering Part 1 questions from past years' IELTS exams",
    this.topics,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.name,
                style: TextStyle(color: context.textColor),
              ),
              background: Container(
                color: context.primaryColor.withOpacity(0.4),
                width: double.infinity,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ColumnInfoDetailWidget(
                    label: S.of(context).whyTakeThisCourse,
                    icon: const Icon(
                      Icons.question_mark_outlined,
                      color: Colors.red,
                      size: 25,
                    ),
                    content: Text(
                      widget.reason,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  ColumnInfoDetailWidget(
                    label: S.of(context).whatWillAbleToDo,
                    icon: const Icon(
                      Icons.question_mark_outlined,
                      color: Colors.red,
                      size: 25,
                    ),
                    content:  Text(
                      widget.purpose,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  ColumnInfoDetailWidget(
                    label: S.of(context).courseLength,
                    icon: Icon(
                      Icons.book,
                      color: context.primaryColor,
                      size: 25,
                    ),
                    content: Text(
                      S.of(context).numOfTopics(3),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      S.of(context).listTopics,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const CustomCardWidget(
                    label: 'Holidays and Vacations',
                  ),
                  CustomCardWidget(
                    label: "Art",
                    onTap: () => Navigator.of(context).pushNamed(
                      RouteList.courseTopicDetail,
                      arguments: const CourseTopicDetailArgument(
                        pdfUrl:
                            "https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileHolidays and Vacations.pdf",
                        title: "Art",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

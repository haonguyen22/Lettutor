import 'package:flutter/material.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/column_info_detail.dart';
import 'package:let_tutor/core/widget/custom_card.dart';
import 'package:let_tutor/domain/entities/course.dart';
import 'package:let_tutor/presentation/course/views/course_topic_detail_screen.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;

  const CourseDetailScreen({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                course.name ?? '',
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
              course.imageUrl ?? '',
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
                    course.name ?? '',
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    course.description ?? '',
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
                      course.reason ?? '',
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
                    content: Text(
                      course.purpose ?? '',
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
                      S.of(context).numOfTopics(course.topics?.length ?? 0),
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
                  const SizedBox(height: 12),
                  ...List.generate(course.topics?.length ?? 0, (int index) {
                    final topic = course.topics?[index];

                    return CustomCardWidget(
                      label: '${index + 1}. ${topic?.name ?? ''}',
                      onTap: () => Navigator.of(context).pushNamed(
                        RouteList.courseTopicDetail,
                        arguments: CourseTopicDetailArgument(
                          pdfUrl: topic?.nameFile ?? '',
                          title: topic?.name ?? '',
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

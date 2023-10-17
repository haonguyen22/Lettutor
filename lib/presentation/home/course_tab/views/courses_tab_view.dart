import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/components/courses/course_card.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/presentation/home/course_tab/bloc/course_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';

class CoursesTabView extends StatefulWidget {
  const CoursesTabView({super.key});

  @override
  State<CoursesTabView> createState() => _CoursesTabViewState();
}

class _CoursesTabViewState extends State<CoursesTabView>
    with TickerProviderStateMixin, LoadMoreMixin {
  late final TextEditingController _search;

  CourseBloc get _courseBloc => context.read<CourseBloc>();

  @override
  void listener() {
    if (isBottom && _courseBloc.state.isLoading == false) {
      _courseBloc.add(FetchCourseEvent(search: _search.text));
    }
  }

  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _courseBloc.add(RefreshCourseEvent());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (_, state) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: S.of(context).search,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      controller: _search,
                      onChanged: (value) {
                        EasyDebounce.debounce("course_search_debounec",
                            const Duration(milliseconds: 500), () {
                          _courseBloc.add(
                            FetchCourseEvent(search: _search.text),
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(
                      state.courses?.length ?? 0,
                      (index) {
                        final course = state.courses![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CourseCardWidget(
                            name: course.name ?? "",
                            imageUrl: course.imageUrl,
                            description: course.description,
                            level: course.level,
                            numOfLesson: course.topics?.length,
                            onTap: () => Navigator.of(context).pushNamed(
                              RouteList.courseDetail,
                              arguments: state.courses![index],
                            ),
                          ),
                        );
                      },
                    ),
                    if (state.isLoading)
                      const Center(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(vertical: 14.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    if (state.hasReachedMax)
                      Center(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              vertical: 14.0),
                          child: Text(S.of(context).noDataResponse),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

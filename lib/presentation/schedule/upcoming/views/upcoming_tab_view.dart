import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/presentation/schedule/upcoming/bloc/upcoming_bloc.dart';
import 'package:let_tutor/presentation/schedule/widgets/schedule_card.dart';

class UpcomingTabView extends StatefulWidget {
  const UpcomingTabView({super.key});

  @override
  State<UpcomingTabView> createState() => _UpcomingTabViewState();
}

class _UpcomingTabViewState extends State<UpcomingTabView> with LoadMoreMixin {
  @override
  void listener() {
    if (isBottom && context.read<UpcomingBloc>().state.isLoading == false) {
      context.read<UpcomingBloc>().add(FetchUpcoming());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<UpcomingBloc, UpcomingState>(
        builder: (_, state) {
          return Column(
            children: [
              const SizedBox(height: 16),
              ...List<Widget>.generate(
                state.upcomingClasses?.length ?? 0,
                (index) {
                  final upcomingClass = state.upcomingClasses![index];
                  final scheduleDetailInfo = upcomingClass.scheduleDetailInfo;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ScheduleCardWidget(
                      scheduleInfo: scheduleDetailInfo?.scheduleInfo,
                      onTap: () {},
                      request: upcomingClass.studentRequest,
                    ),
                  );
                },
              ),
              if (state.isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CircularProgressIndicator(),
                  ),
                ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}

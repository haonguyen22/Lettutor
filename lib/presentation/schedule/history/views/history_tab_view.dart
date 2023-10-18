import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/extensions/string_ext.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/presentation/schedule/history/bloc/history_bloc.dart';
import 'package:let_tutor/presentation/schedule/history/views/history_card.dart';

class HistoryTabView extends StatefulWidget {
  const HistoryTabView({super.key});

  @override
  State<HistoryTabView> createState() => _HistoryTabViewState();
}

class _HistoryTabViewState extends State<HistoryTabView> with LoadMoreMixin {
  @override
  void listener() {
    if (isBottom && context.read<HistoryBloc>().state.isLoading == false) {
      context.read<HistoryBloc>().add(FetchHistoryPagination());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HistoryBloc>().add(RefreshHistoryPagination());
      },
      child: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (_, state) {
            return Column(
              children: [
                ...List<Widget>.generate(
                  state.bookedClasses?.length ?? 0,
                  (index) {
                    final history = state.bookedClasses?[index];
                    final scheduleDetailInfo = history?.scheduleDetailInfo;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: HistoryCardWidget(
                        tutor: scheduleDetailInfo?.scheduleInfo?.tutorInfo
                            ?.toEntity(),
                        date: scheduleDetailInfo!.scheduleInfo!.date!
                            .convertToDateTime(),
                        timeStart: scheduleDetailInfo.startPeriod,
                        timeEnd: scheduleDetailInfo.endPeriod,
                        onTap: () {},
                        request: history?.studentRequest,
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
      ),
    );
  }
}

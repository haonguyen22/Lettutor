import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/components/tutors/tutor_card.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/mixin/load_more_mixin.dart';
import 'package:let_tutor/core/widget/wrap_list.dart';
import 'package:let_tutor/dummy/data.dart';
import 'package:let_tutor/presentation/home/tutor_tab/bloc/search_tutor_bloc.dart';
import 'package:localization/generated/l10n.dart';

class TutorTabView extends StatefulWidget {
  const TutorTabView({super.key});

  @override
  State<TutorTabView> createState() => _TutorTabViewState();
}

class _TutorTabViewState extends State<TutorTabView> with LoadMoreMixin {
  final TextEditingController tutorName = TextEditingController();
  Nationality? nationality = Nationality.vietnamese;

  int _specialityIndex = -1;
  Map<String, dynamic> body = {};

  SearchTutorBloc get searchTutorBloc => context.read<SearchTutorBloc>();

  @override
  void listener() {
    if (isBottom &&
        searchTutorBloc.state.isLoading == false &&
        searchTutorBloc.state is SearchTutorSuccess) {
      searchTutorBloc.add(FetchSearchTutorLoadMore(body: body));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> specialitiesLabel = [
      S.of(context).all,
      ...learnTopics.map((e) => e["name"] as String).toList(),
      ...testPreparations.map((e) => e["name"] as String).toList(),
    ];
    List<dynamic> specialties = [
      ...learnTopics,
      ...testPreparations,
    ];

    void onTapSearchBtn() {
      body = {
        "page": 1,
        "perPage": 10,
        "search": tutorName.text,
        "filters": {
          "specialties": _specialityIndex == -1
              ? []
              : [specialties[_specialityIndex]["key"]],
          "nationality": {}
        }
      };
      searchTutorBloc.add(FetchSearchTutor(body: body));
    }

    void onTapResetFilter() {
      context.read<SearchTutorBloc>().add(ResetSearchTutor());
      tutorName.clear();
      _specialityIndex = -1;
    }

    return Scaffold(
      body: BlocBuilder<SearchTutorBloc, SearchTutorState>(
        builder: (_, state) {
          return Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 30),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).findATutor,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: S.of(context).enterTutorName,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    controller: tutorName,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).nationality,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.textColor,
                    ),
                  ),
                  Row(
                    children: [
                      Radio<Nationality>(
                        activeColor: Colors.blue,
                        value: Nationality.vietnamese,
                        groupValue: nationality,
                        onChanged: (value) {
                          setState(() {
                            nationality = value;
                          });
                        },
                      ),
                      Text(S.of(context).vietnameseTutors),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<Nationality>(
                        activeColor: Colors.blue,
                        value: Nationality.foreign,
                        groupValue: nationality,
                        onChanged: (value) {
                          setState(() {
                            nationality = value;
                          });
                        },
                      ),
                      Text(S.of(context).foreignTutors),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    S.of(context).specialities,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  WrapListWidget(
                    currentIndex: _specialityIndex + 1,
                    listLabel: specialitiesLabel,
                    onTap: (index) {
                      setState(() {
                        _specialityIndex = index - 1;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onTapResetFilter,
                        style: TextButton.styleFrom(
                          foregroundColor: context.primaryColor,
                        ),
                        child: Text(S.of(context).resetFilters),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: onTapSearchBtn,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: context.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                        child: Text(S.of(context).search),
                      )
                    ],
                  ),
                  if (state is SearchTutorInitial && state.isLoading)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  if (state is SearchTutorSuccess &&
                      (state.tutors?.isEmpty ?? true)) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                    Text(
                      S.of(context).noResultSearch,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.textColor,
                      ),
                    ),
                  ],
                  if (state is SearchTutorSuccess &&
                      (state.tutors?.isNotEmpty ?? false)) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                    Text(
                      S.of(context).foundNResult(state.count),
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.textColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      state.tutors?.length ?? 0,
                      (index) {
                        final tutor = state.tutors![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: TutorCardWidget(
                            name: tutor.name,
                            imageUrl: tutor.imageUrl,
                            description: tutor.bio,
                            tags: tutor.specialties?.split(','),
                            country: tutor.country,
                            rating: tutor.rating?.floor() ?? 0,
                          ),
                        );
                      },
                    ),
                    if (state.isLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    if (state.hasReachedMax)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child:
                            Center(child: Text(S.of(context).noDataResponse)),
                      ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum Nationality {
  vietnamese,
  foreign,
  ;
}

enum TestPreparations {
  starters,
  movers,
  flyers,
  ket,
  pet,
  ielts,
  toefl,
  toeic,
  ;
}

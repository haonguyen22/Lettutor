// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/components/tutors/tutor_report_dialog.dart';
import 'package:let_tutor/core/constants/colors.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/column_info_detail.dart';
import 'package:let_tutor/core/widget/video.dart';
import 'package:let_tutor/core/widget/wrap_list.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_detail_bloc.dart';
import 'package:let_tutor/routes/route_list.dart';
import 'package:localization/generated/l10n.dart';

import '../../../core/widget/icon_label.dart';

const _kDefaultImage = "assets/icons/logo.png";

class TutorDetailScreen extends StatefulWidget {
  const TutorDetailScreen({
    super.key,
  });

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  TutorDetailBloc get tutorDetailBloc => context.read<TutorDetailBloc>();
  late TextEditingController reportTextController;

  @override
  void initState() {
    reportTextController = TextEditingController();
    tutorDetailBloc.add(FetchTutorByIdEvent());
    super.initState();
  }

  @override
  void dispose() {
    reportTextController.dispose();
    super.dispose();
  }

  Future<void> onTapReport() async {
    final tutor = tutorDetailBloc.state.tutor;
    final isSubmit = await showDialog(
      context: context,
      builder: (context) => TutorReportDialog(
        tutor: tutorDetailBloc.state.tutor,
        controller: reportTextController,
      ),
    );
    if (isSubmit) {
      try {
        tutorDetailBloc.add(
          ReportTutorEvent(
            tutorId: tutor?.userId ?? "",
            content: reportTextController.text,
            onSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context).reportSuccessfully)),
            ),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(S.of(context).reportError)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                tutorDetailBloc.tutorParam.name ?? "",
                style: TextStyle(color: context.textColor),
              ),
              background: Container(
                color: context.primaryColor.withOpacity(0.4),
                width: double.infinity,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12.0, vertical: 16.0),
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<TutorDetailBloc, TutorDetailState>(
                builder: (_, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final tutor = state.tutor;
                  return Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: state is TutorDetailSuccess &&
                                state.processing == true
                            ? const CircularProgressIndicator()
                            : null,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: tutor?.imageUrl != null
                                      ? Image.network(
                                          tutor!.imageUrl!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            _kDefaultImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Image.asset(
                                          _kDefaultImage,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.name,
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        ...List.generate(
                                          5,
                                          (index) {
                                            return Icon(
                                              index <
                                                      (tutor?.rating?.floor() ??
                                                          0)
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              size: 16,
                                              color: starColor,
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '(${tutor?.totalFeedback})',
                                        ),
                                      ],
                                    ),
                                    if (tutor?.country?.isNotEmpty ?? false)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
                                        child: Text(
                                          tutor!.country!,
                                          style: context.textTheme.bodyLarge
                                              ?.copyWith(
                                            color: Theme.of(context).hintColor,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            tutor?.bio ?? "",
                            style: context.textTheme.labelLarge,
                            textAlign: TextAlign.justify,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconLabelWidget(
                                  icon: state.tutor?.isFavorite ?? false
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  label: S.of(context).favorite,
                                  onTap: () =>
                                      tutorDetailBloc.add(FavoriteTutorEvent()),
                                ),
                                IconLabelWidget(
                                  icon: Icons.info_outline,
                                  label: S.of(context).report,
                                  onTap: onTapReport,
                                ),
                                IconLabelWidget(
                                  icon: Icons.reviews_outlined,
                                  label: S.of(context).review,
                                  onTap: () => Navigator.of(context).pushNamed(
                                      RouteList.review,
                                      arguments: tutor),
                                ),
                              ],
                            ),
                          ),
                          if (tutor?.video != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: CustomVideoPlayerWidget(
                                tutor!.video!,
                              ),
                            ),
                          const SizedBox(height: 12),
                          ColumnInfoDetailWidget(
                            label: S.of(context).education,
                            content: Text(
                              tutor?.education ?? '',
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                          ColumnInfoDetailWidget(
                            label: S.of(context).language,
                            content: WrapListWidget(
                              listLabel: tutor?.languages?.split(','),
                            ),
                          ),
                          ColumnInfoDetailWidget(
                            label: S.of(context).specialities,
                            content: WrapListWidget(
                              listLabel: tutor?.specialties?.split(','),
                            ),
                          ),
                          ColumnInfoDetailWidget(
                            label: S.of(context).interests,
                            content: Text(
                              tutor?.interests ?? '',
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                          ColumnInfoDetailWidget(
                            label: S.of(context).teachingExperience,
                            content: Text(
                              tutor?.experience ?? '',
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

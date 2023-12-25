import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/extensions/string_ext.dart';
import 'package:let_tutor/core/mixin/image_picker_mixin.dart';
import 'package:let_tutor/core/widget/custom_input_field.dart';
import 'package:let_tutor/core/widget/divider_label.dart';
import 'package:let_tutor/core/widget/multi_choice.dart';
import 'package:let_tutor/core/widget/selection_input.dart';
import 'package:let_tutor/data/models/tutor/become_tutor_data.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/dummy/country.dart';
import 'package:let_tutor/dummy/data.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:let_tutor/presentation/become_tutor/bloc/become_tutor_bloc.dart';
import 'package:localization/generated/l10n.dart';

class CompleteProfileStepScreen extends StatefulWidget {
  final Function(BecomeTutorData) onNext;

  const CompleteProfileStepScreen({
    super.key,
    required this.onNext,
  });

  @override
  State<CompleteProfileStepScreen> createState() =>
      _CompleteProfileStepScreenState();
}

class _CompleteProfileStepScreenState extends State<CompleteProfileStepScreen>
    with ImagePickerMixin {
  User? get user => context.read<AuthBloc>().state.user;

  BecomeTutorData? get becomeTutorData =>
      context.read<BecomeTutorBloc>().state.becomeTutorData;

  late TextEditingController nameCtrl;
  late TextEditingController interestsCtrl;
  late TextEditingController educationCtrl;
  late TextEditingController experienceCtrl;
  late TextEditingController professionCtrl;
  late TextEditingController languageCtrl;
  late TextEditingController bioCtrl;

  late String? avatar;

  String? country;
  late DateTime birthday;
  String teachingLevelIndex = teachingLevels[0];
  List<String> specialtiesChoice = [];

  List<String> get specialties =>
      List<String>.from(learnTopics.map((e) => e["key"] as String).toList())
        ..addAll(testPreparations.map((e) => e["key"] as String).toList());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final specialtiesUser = user?.testPreparations?.map((e) => e.key).toList();
    specialtiesUser
        ?.addAll(user?.learnTopics?.map((e) => e.key).toList() ?? []);

    specialtiesChoice = becomeTutorData?.specialties ?? specialtiesUser ?? [];
    country =
        becomeTutorData?.country ?? user?.country ?? countryList.values.first;
    nameCtrl = TextEditingController(text: becomeTutorData?.name ?? user?.name);
    interestsCtrl = TextEditingController(text: becomeTutorData?.interests);
    educationCtrl = TextEditingController(text: becomeTutorData?.education);
    experienceCtrl = TextEditingController(text: becomeTutorData?.experience);
    professionCtrl = TextEditingController(text: becomeTutorData?.profession);
    languageCtrl =
        TextEditingController(text: becomeTutorData?.languages?.join(','));
    bioCtrl = TextEditingController(text: becomeTutorData?.bio);
    birthday = becomeTutorData?.birthDay ??
        user?.birthday ??
        DateTime.now().copyWith(year: 2000);
    avatar = becomeTutorData?.avatar;
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    interestsCtrl.dispose();
    educationCtrl.dispose();
    experienceCtrl.dispose();
    professionCtrl.dispose();
    super.dispose();
  }

  void onTapChangeBirthdayTime() async {
    final now = DateTime.now();
    final DateTime? value = await showDatePicker(
      context: context,
      initialDate: birthday,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 100),
    );
    if (value != null) {
      setState(() {
        birthday = value;
      });
    }
  }

  void onTapSpecialties(index) {
    setState(() {
      final value = specialties[index];
      if (specialtiesChoice.contains(value)) {
        specialtiesChoice.remove(value);
      } else {
        specialtiesChoice.add(value);
      }
    });
  }

  void onNextTap() {
    if (_formKey.currentState!.validate()) {
      widget.onNext(
        BecomeTutorData(
          avatar: avatar,
          name: nameCtrl.text,
          country: country,
          birthDay: birthday,
          interests: interestsCtrl.text,
          education: educationCtrl.text,
          experience: experienceCtrl.text,
          profession: professionCtrl.text,
          languages: languageCtrl.text.split(','),
          bio: bioCtrl.text,
          targetStudent: teachingLevelIndex,
          specialties: specialtiesChoice,
        ),
      );
    } else {
      context.showSnackBar(
        message: S.of(context).pleaseFillInAllFields,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            S.of(context).setUpProfile,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).editTutorProfileLater,
            style: context.textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).newStudentMayBrowseTutorProfiles,
            style: context.textTheme.bodyLarge,
          ),
          DividerLabelWidget(label: S.of(context).basicInfo),
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: context.backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                child: avatar != null
                    ? Image.file(File(avatar!), fit: BoxFit.cover)
                    : user?.avatar != null
                        ? Image.network(user!.avatar!, fit: BoxFit.cover)
                        : Image.asset(
                            'assets/icons/logo.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person_rounded),
                          ),
              ),
              Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 0,
                end: 0,
                child: GestureDetector(
                  onTap: () => showImagePicker(
                    onSelected: (file) {
                      setState(() {
                        avatar = file.path;
                      });
                    },
                  ),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.primaryColor,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomInputLabelField(
            label: S.of(context).name,
            controller: nameCtrl,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).nameIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          SelectionInputWidget<String>(
            label: S.of(context).country,
            listValue: countryList.values.toList(),
            listLabel: countryList.values.toList(),
            initialSelection: country,
            onSelected: (value) {
              setState(() {
                country = value ?? '';
              });
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8.0),
              child: Text(
                S.of(context).birthday,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapChangeBirthdayTime,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(color: context.textColor!.withOpacity(0.6)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat("dd/MM/yyyy").format(birthday),
                  ),
                  const Icon(Icons.calendar_month),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const DividerLabelWidget(label: "CV"),
          const SizedBox(height: 10),
          CustomInputLabelField(
            label: S.of(context).interests,
            controller: interestsCtrl,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).interestsIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputLabelField(
            label: S.of(context).education,
            controller: educationCtrl,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).educationIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputLabelField(
            label: S.of(context).experience,
            controller: experienceCtrl,
            hintText: S.of(context).experienceHint,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).experienceIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomInputLabelField(
            label: S.of(context).profession,
            controller: professionCtrl,
            hintText: S.of(context).professionHint,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).professionIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          DividerLabelWidget(label: S.of(context).languageISpeak),
          const SizedBox(height: 10),
          CustomInputLabelField(
            label: S.of(context).languages,
            controller: languageCtrl,
            hintText: S.of(context).languagesHint,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).languagesIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                S.of(context).whoITeach,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(width: 10),
              const Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 10),
          CustomInputLabelField(
            label: S.of(context).introduction,
            controller: bioCtrl,
            hintText: S.of(context).introductionHint,
            onValidator: (input) {
              if (input == null || input.isEmpty) {
                return S.of(context).introductionIsRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          SelectionInputWidget<String>(
            label: S.of(context).bestStudentWhoAre,
            listValue: teachingLevels,
            listLabel: teachingLevels,
            initialSelection: teachingLevelIndex,
            onSelected: (value) {
              if (value != null) return;
              setState(() {
                teachingLevelIndex = value!;
              });
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8.0),
              child: Text(
                S.of(context).specialities,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: MultiChoiceWidget(
              listItem: specialties,
              listItemChoice: specialtiesChoice,
              listLabel: specialties.join(",").toSpecialties(),
              onCondition: (index) {
                return specialtiesChoice.contains(specialties[index]);
              },
              onTap: onTapSpecialties,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: context.widthDevice,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onNextTap,
              child: Text(S.of(context).next),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/custom_input_field.dart';
import 'package:let_tutor/core/widget/multi_choice.dart';
import 'package:let_tutor/core/widget/selection_input.dart';
import 'package:let_tutor/dummy/country.dart';
import 'package:let_tutor/dummy/data.dart';
import 'package:let_tutor/presentation/auth/bloc/auth_bloc.dart';
import 'package:localization/generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController noteCtrl = TextEditingController();
  String country = '';
  String level = '';
  List<String> topics = [];
  List<String> tests = [];
  DateTime? birthday;
  String dropdownValue = '';

  @override
  void dispose() {
    nameCtrl.dispose();
    phoneNumberCtrl.dispose();
    noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        backgroundColor: context.primaryColor.withOpacity(0.4),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Stack(
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
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ]),
                          child: Image.asset(
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Haonguyencp2@@gmail.com',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Account ID: 12341234 1234 123412 34',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 14),
                  CustomInputLabelField(
                    label: S.of(context).name,
                    controller: nameCtrl,
                  ),
                  const SizedBox(height: 10),
                  CustomInputLabelField(
                    label: S.of(context).phone,
                    controller: phoneNumberCtrl,
                  ),
                  const SizedBox(height: 10),
                  SelectionInputWidget<String>(
                    label: S.of(context).country,
                    listValue: countryList.values.toList(),
                    listLabel: countryList.values.toList(),
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
                    onTap: () async {
                      final DateTime? value = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(now.year - 100),
                        lastDate: DateTime(now.year + 100),
                        onDatePickerModeChange: (value) {},
                      );
                      if (value != null) {
                        setState(() {
                          birthday = value;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 14),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: context.textColor!.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(birthday != null
                              ? DateFormat("dd/MM/yyyy").format(birthday!)
                              : ''),
                          const Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectionInputWidget<String>(
                    label: S.of(context).myLevel,
                    listValue: levels,
                    listLabel: levels,
                    onSelected: (value) {
                      setState(() {
                        level = value ?? '';
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                      child: Text(
                        S.of(context).topic,
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
                      listItem: learnTopics,
                      listItemChoice: topics,
                      onTap: (index) {
                        setState(() {
                          final value = learnTopics[index];
                          if (topics.contains(value)) {
                            topics.remove(value);
                          } else {
                            topics.add(value);
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                      child: Text(
                        S.of(context).testPreparations,
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
                      listItem: testPreparations,
                      listItemChoice: tests,
                      onTap: (index) {
                        setState(() {
                          final value = testPreparations[index];
                          if (tests.contains(value)) {
                            tests.remove(value);
                          } else {
                            tests.add(value);
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInputLabelField(
                    label: S.of(context).studySchedule,
                    controller: noteCtrl,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                      backgroundColor: context.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).save,
                          style: context.textTheme.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

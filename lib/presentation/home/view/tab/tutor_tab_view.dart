import 'package:flutter/material.dart';
import 'package:let_tutor/core/components/tutors/tutor_card.dart';
import 'package:let_tutor/core/extensions/context_ext.dart';
import 'package:let_tutor/core/widget/wrap_list.dart';
import 'package:localization/generated/l10n.dart';

class TutorTabView extends StatefulWidget {
  const TutorTabView({super.key});

  @override
  State<TutorTabView> createState() => _TutorTabViewState();
}

class _TutorTabViewState extends State<TutorTabView> {
  final TextEditingController tutorName = TextEditingController();
  Nationality? nationality = Nationality.vietnamese;

  int _specialityIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> specialities = [
      S.of(context).all,
      S.of(context).englishForKids,
      S.of(context).englishForBusiness,
      S.of(context).conversational,
      ...TestPreparations.values.map((e) => e.name.toUpperCase()),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 30),
        child: SingleChildScrollView(
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
                    value: Nationality.vietnamese,
                    groupValue: nationality,
                    onChanged: (value) {
                      setState(() {
                        nationality = value;
                      });
                    },
                  ),
                  const Text('Vietnamese Tutors'),
                ],
              ),
              Row(
                children: [
                  Radio<Nationality>(
                    value: Nationality.foreign,
                    groupValue: nationality,
                    onChanged: (value) {
                      setState(() {
                        nationality = value;
                      });
                    },
                  ),
                  const Text('Foreign Tutors'),
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
                currentIndex: _specialityIndex,
                listItem: specialities,
                onTap: (index) {
                  setState(() {
                    _specialityIndex = index;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(S.of(context).resetFilters),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              ),
              Text(
                S.of(context).foundNResult(3),
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.textColor,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                5,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: TutorCardWidget(
                    name: 'Dang Thu Ha (Lucy)',
                    imageUrl:
                        'https://api.app.lettutor.com/avatar/7f663cef-2529-4f01-9c25-e71300727b56avatar1686546526450.jpg',
                    description:
                        'Hello! I am Teacher Charis from the Philippines. I have offline and online teaching experience. I completed my degree as an English Major. I am patient, enthusiastic, and passionate when it comes to teaching, particularly in English language. If you want an engaging class with me, do not hesitate to be my student. Teacher Charis at your service!',
                    tags: [
                      "English for kids",
                      "English for Business",
                      "Conversational",
                      "STARTERS"
                    ],
                    country: "Philippines",
                    rating: 5,
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

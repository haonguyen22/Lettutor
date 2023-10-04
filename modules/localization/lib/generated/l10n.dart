// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Become fluent faster through one on one video chat lessons tailored to your goals.`
  String get loginDescription {
    return Intl.message(
      'Become fluent faster through one on one video chat lessons tailored to your goals.',
      name: 'loginDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Not a member yet?`
  String get notAMember {
    return Intl.message(
      'Not a member yet?',
      name: 'notAMember',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `You have no upcoming lesson.`
  String get noUpcommingLesson {
    return Intl.message(
      'You have no upcoming lesson.',
      name: 'noUpcommingLesson',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to LetTutor!`
  String get welcomeToLetTutor {
    return Intl.message(
      'Welcome to LetTutor!',
      name: 'welcomeToLetTutor',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Tutors`
  String get tutors {
    return Intl.message(
      'Tutors',
      name: 'tutors',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Find a tutor`
  String get findATutor {
    return Intl.message(
      'Find a tutor',
      name: 'findATutor',
      desc: '',
      args: [],
    );
  }

  /// `Enter tutor name`
  String get enterTutorName {
    return Intl.message(
      'Enter tutor name',
      name: 'enterTutorName',
      desc: '',
      args: [],
    );
  }

  /// `Select tutor nationality`
  String get selectTutorNationality {
    return Intl.message(
      'Select tutor nationality',
      name: 'selectTutorNationality',
      desc: '',
      args: [],
    );
  }

  /// `Select available tutoring time:`
  String get selectTutorTime {
    return Intl.message(
      'Select available tutoring time:',
      name: 'selectTutorTime',
      desc: '',
      args: [],
    );
  }

  /// `Select a day`
  String get selectDay {
    return Intl.message(
      'Select a day',
      name: 'selectDay',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get startTime {
    return Intl.message(
      'Start time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get endTime {
    return Intl.message(
      'End time',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `Reset Filters`
  String get resetFilters {
    return Intl.message(
      'Reset Filters',
      name: 'resetFilters',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Tutors`
  String get recommendedTutors {
    return Intl.message(
      'Recommended Tutors',
      name: 'recommendedTutors',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `English for kids`
  String get englishForKids {
    return Intl.message(
      'English for kids',
      name: 'englishForKids',
      desc: '',
      args: [],
    );
  }

  /// `English for Business`
  String get englishForBusiness {
    return Intl.message(
      'English for Business',
      name: 'englishForBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Conversational`
  String get conversational {
    return Intl.message(
      'Conversational',
      name: 'conversational',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Specialities`
  String get specialities {
    return Intl.message(
      'Specialities',
      name: 'specialities',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Found {num} result(s)`
  String foundNResult(Object num) {
    return Intl.message(
      'Found $num result(s)',
      name: 'foundNResult',
      desc: '',
      args: [num],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

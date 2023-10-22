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

  /// `E-books`
  String get eBooks {
    return Intl.message(
      'E-books',
      name: 'eBooks',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light theme`
  String get lightTheme {
    return Intl.message(
      'Light theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Become A Tutor`
  String get becomeATutor {
    return Intl.message(
      'Become A Tutor',
      name: 'becomeATutor',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Teaching Experience`
  String get teachingExperience {
    return Intl.message(
      'Teaching Experience',
      name: 'teachingExperience',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Why take this courses`
  String get whyTakeThisCourse {
    return Intl.message(
      'Why take this courses',
      name: 'whyTakeThisCourse',
      desc: '',
      args: [],
    );
  }

  /// `What will you be able to do`
  String get whatWillAbleToDo {
    return Intl.message(
      'What will you be able to do',
      name: 'whatWillAbleToDo',
      desc: '',
      args: [],
    );
  }

  /// `Course Length`
  String get courseLength {
    return Intl.message(
      'Course Length',
      name: 'courseLength',
      desc: '',
      args: [],
    );
  }

  /// `{num} topics`
  String numOfTopics(Object num) {
    return Intl.message(
      '$num topics',
      name: 'numOfTopics',
      desc: '',
      args: [num],
    );
  }

  /// `List Topics`
  String get listTopics {
    return Intl.message(
      'List Topics',
      name: 'listTopics',
      desc: '',
      args: [],
    );
  }

  /// `{num} lessons`
  String numOfLessons(Object num) {
    return Intl.message(
      '$num lessons',
      name: 'numOfLessons',
      desc: '',
      args: [num],
    );
  }

  /// `Vietnamese Tutors`
  String get vietnameseTutors {
    return Intl.message(
      'Vietnamese Tutors',
      name: 'vietnameseTutors',
      desc: '',
      args: [],
    );
  }

  /// `Foreign Tutors`
  String get foreignTutors {
    return Intl.message(
      'Foreign Tutors',
      name: 'foreignTutors',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone {
    return Intl.message(
      'Phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Topic`
  String get topic {
    return Intl.message(
      'Topic',
      name: 'topic',
      desc: '',
      args: [],
    );
  }

  /// `Test preparations`
  String get testPreparations {
    return Intl.message(
      'Test preparations',
      name: 'testPreparations',
      desc: '',
      args: [],
    );
  }

  /// `Study schedule`
  String get studySchedule {
    return Intl.message(
      'Study schedule',
      name: 'studySchedule',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `My Level`
  String get myLevel {
    return Intl.message(
      'My Level',
      name: 'myLevel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Go To Meeting`
  String get goToMeeting {
    return Intl.message(
      'Go To Meeting',
      name: 'goToMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Add A Review`
  String get addAReview {
    return Intl.message(
      'Add A Review',
      name: 'addAReview',
      desc: '',
      args: [],
    );
  }

  /// `You have booked {num} class(es)`
  String bookNumClasses(Object num) {
    return Intl.message(
      'You have booked $num class(es)',
      name: 'bookNumClasses',
      desc: '',
      args: [num],
    );
  }

  /// `Please enter a valid email address.`
  String get notValidEmail {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please check all of the input again`
  String get checkValidate {
    return Intl.message(
      'Please check all of the input again',
      name: 'checkValidate',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get min8Characters {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'min8Characters',
      desc: '',
      args: [],
    );
  }

  /// `No data response`
  String get noDataResponse {
    return Intl.message(
      'No data response',
      name: 'noDataResponse',
      desc: '',
      args: [],
    );
  }

  /// `No result search`
  String get noResultSearch {
    return Intl.message(
      'No result search',
      name: 'noResultSearch',
      desc: '',
      args: [],
    );
  }

  /// `There is no review`
  String get noReview {
    return Intl.message(
      'There is no review',
      name: 'noReview',
      desc: '',
      args: [],
    );
  }

  /// `Report {tutor}`
  String reportTutor(Object tutor) {
    return Intl.message(
      'Report $tutor',
      name: 'reportTutor',
      desc: '',
      args: [tutor],
    );
  }

  /// `Help us understand what's happening`
  String get helpUsToUnderstand {
    return Intl.message(
      'Help us understand what\'s happening',
      name: 'helpUsToUnderstand',
      desc: '',
      args: [],
    );
  }

  /// `Inappropriate profile photo`
  String get inappropriatePhoto {
    return Intl.message(
      'Inappropriate profile photo',
      name: 'inappropriatePhoto',
      desc: '',
      args: [],
    );
  }

  /// `This profile is pretending be someone or is fake`
  String get profilePretendingOrFake {
    return Intl.message(
      'This profile is pretending be someone or is fake',
      name: 'profilePretendingOrFake',
      desc: '',
      args: [],
    );
  }

  /// `This tutor is annoying me`
  String get tutorAnnoyMe {
    return Intl.message(
      'This tutor is annoying me',
      name: 'tutorAnnoyMe',
      desc: '',
      args: [],
    );
  }

  /// `Please let us know details about your problems`
  String get letUsKnowDetailsYourProblem {
    return Intl.message(
      'Please let us know details about your problems',
      name: 'letUsKnowDetailsYourProblem',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Report Successfully !!`
  String get reportSuccessfully {
    return Intl.message(
      'Report Successfully !!',
      name: 'reportSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Report Error, please check again`
  String get reportError {
    return Intl.message(
      'Report Error, please check again',
      name: 'reportError',
      desc: '',
      args: [],
    );
  }

  /// `Lesson Time: `
  String get lessonTime {
    return Intl.message(
      'Lesson Time: ',
      name: 'lessonTime',
      desc: '',
      args: [],
    );
  }

  /// `Request for lesson: {str}`
  String studentRequest(Object str) {
    return Intl.message(
      'Request for lesson: $str',
      name: 'studentRequest',
      desc: '',
      args: [str],
    );
  }

  /// `Booked`
  String get booked {
    return Intl.message(
      'Booked',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Lesson`
  String get upcomingLesson {
    return Intl.message(
      'Upcoming Lesson',
      name: 'upcomingLesson',
      desc: '',
      args: [],
    );
  }

  /// `Total lesson is {num} hours {num2} minutes`
  String totalLessionIs(Object num, Object num2) {
    return Intl.message(
      'Total lesson is $num hours $num2 minutes',
      name: 'totalLessionIs',
      desc: '',
      args: [num, num2],
    );
  }

  /// `Enter Lesson Room`
  String get enterLessonRoom {
    return Intl.message(
      'Enter Lesson Room',
      name: 'enterLessonRoom',
      desc: '',
      args: [],
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

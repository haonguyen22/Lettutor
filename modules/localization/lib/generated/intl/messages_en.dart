// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(num) => "You have booked ${num} class(es)";

  static String m1(num) => "Found ${num} result(s)";

  static String m2(num) => "${num} lessons";

  static String m3(num) => "${num} topics";

  static String m4(tutor) => "Report ${tutor}";

  static String m5(str) => "Request for lesson: ${str}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "addAReview": MessageLookupByLibrary.simpleMessage("Add A Review"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
        "becomeATutor": MessageLookupByLibrary.simpleMessage("Become A Tutor"),
        "birthday": MessageLookupByLibrary.simpleMessage("Birthday"),
        "book": MessageLookupByLibrary.simpleMessage("Book"),
        "bookNumClasses": m0,
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "checkValidate": MessageLookupByLibrary.simpleMessage(
            "Please check all of the input again"),
        "contact": MessageLookupByLibrary.simpleMessage("Contact"),
        "conversational":
            MessageLookupByLibrary.simpleMessage("Conversational"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "courseLength": MessageLookupByLibrary.simpleMessage("Course Length"),
        "courses": MessageLookupByLibrary.simpleMessage("Courses"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "eBooks": MessageLookupByLibrary.simpleMessage("E-books"),
        "education": MessageLookupByLibrary.simpleMessage("Education"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email Address"),
        "endTime": MessageLookupByLibrary.simpleMessage("End time"),
        "englishForBusiness":
            MessageLookupByLibrary.simpleMessage("English for Business"),
        "englishForKids":
            MessageLookupByLibrary.simpleMessage("English for kids"),
        "enterTutorName":
            MessageLookupByLibrary.simpleMessage("Enter tutor name"),
        "favorite": MessageLookupByLibrary.simpleMessage("Favorite"),
        "findATutor": MessageLookupByLibrary.simpleMessage("Find a tutor"),
        "foreignTutors": MessageLookupByLibrary.simpleMessage("Foreign Tutors"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "foundNResult": m1,
        "goToMeeting": MessageLookupByLibrary.simpleMessage("Go To Meeting"),
        "helpUsToUnderstand": MessageLookupByLibrary.simpleMessage(
            "Help us understand what\'s happening"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "inappropriatePhoto":
            MessageLookupByLibrary.simpleMessage("Inappropriate profile photo"),
        "interests": MessageLookupByLibrary.simpleMessage("Interests"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languages": MessageLookupByLibrary.simpleMessage("Languages"),
        "lessonTime": MessageLookupByLibrary.simpleMessage("Lesson Time: "),
        "letUsKnowDetailsYourProblem": MessageLookupByLibrary.simpleMessage(
            "Please let us know details about your problems"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Light theme"),
        "listTopics": MessageLookupByLibrary.simpleMessage("List Topics"),
        "logIn": MessageLookupByLibrary.simpleMessage("Log In"),
        "logOut": MessageLookupByLibrary.simpleMessage("Log Out"),
        "loginDescription": MessageLookupByLibrary.simpleMessage(
            "Become fluent faster through one on one video chat lessons tailored to your goals."),
        "min8Characters": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters long."),
        "myLevel": MessageLookupByLibrary.simpleMessage("My Level"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
        "noDataResponse":
            MessageLookupByLibrary.simpleMessage("No data response"),
        "noResultSearch":
            MessageLookupByLibrary.simpleMessage("No result search"),
        "noReview": MessageLookupByLibrary.simpleMessage("There is no review"),
        "noUpcommingLesson": MessageLookupByLibrary.simpleMessage(
            "You have no upcoming lesson."),
        "notAMember": MessageLookupByLibrary.simpleMessage("Not a member yet?"),
        "notValidEmail": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address."),
        "numOfLessons": m2,
        "numOfTopics": m3,
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Or continue with"),
        "overview": MessageLookupByLibrary.simpleMessage("Overview"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone number"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profilePretendingOrFake": MessageLookupByLibrary.simpleMessage(
            "This profile is pretending be someone or is fake"),
        "recommendedTutors":
            MessageLookupByLibrary.simpleMessage("Recommended Tutors"),
        "report": MessageLookupByLibrary.simpleMessage("Report"),
        "reportError": MessageLookupByLibrary.simpleMessage(
            "Report Error, please check again"),
        "reportSuccessfully":
            MessageLookupByLibrary.simpleMessage("Report Successfully !!"),
        "reportTutor": m4,
        "resetFilters": MessageLookupByLibrary.simpleMessage("Reset Filters"),
        "review": MessageLookupByLibrary.simpleMessage("Review"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "schedule": MessageLookupByLibrary.simpleMessage("Schedule"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "selectDay": MessageLookupByLibrary.simpleMessage("Select a day"),
        "selectTutorNationality":
            MessageLookupByLibrary.simpleMessage("Select tutor nationality"),
        "selectTutorTime": MessageLookupByLibrary.simpleMessage(
            "Select available tutoring time:"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "specialities": MessageLookupByLibrary.simpleMessage("Specialities"),
        "startTime": MessageLookupByLibrary.simpleMessage("Start time"),
        "studentRequest": m5,
        "studySchedule": MessageLookupByLibrary.simpleMessage("Study schedule"),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "teachingExperience":
            MessageLookupByLibrary.simpleMessage("Teaching Experience"),
        "termAndConditions":
            MessageLookupByLibrary.simpleMessage("Terms & Conditions"),
        "testPreparations":
            MessageLookupByLibrary.simpleMessage("Test preparations"),
        "topic": MessageLookupByLibrary.simpleMessage("Topic"),
        "tutorAnnoyMe":
            MessageLookupByLibrary.simpleMessage("This tutor is annoying me"),
        "tutors": MessageLookupByLibrary.simpleMessage("Tutors"),
        "upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
        "vietnameseTutors":
            MessageLookupByLibrary.simpleMessage("Vietnamese Tutors"),
        "welcomeToLetTutor":
            MessageLookupByLibrary.simpleMessage("Welcome to LetTutor!"),
        "whatWillAbleToDo":
            MessageLookupByLibrary.simpleMessage("What will you be able to do"),
        "whyTakeThisCourse":
            MessageLookupByLibrary.simpleMessage("Why take this courses")
      };
}

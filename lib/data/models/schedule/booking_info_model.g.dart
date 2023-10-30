// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingInfoModel _$$_BookingInfoModelFromJson(Map<String, dynamic> json) =>
    _$_BookingInfoModel(
      createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      studentMeetingLink: json['studentMeetingLink'] as String?,
      googleMeetLink: json['googleMeetLink'] as String?,
      studentRequest: json['studentRequest'] as String?,
      tutorReview: json['tutorReview'] as String?,
      scoreByTutor: json['scoreByTutor'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      recordUrl: json['recordUrl'] as String?,
      cancelReasonId: json['cancelReasonId'] as int?,
      lessonPlanId: json['lessonPlanId'] as int?,
      cancelNote: json['cancelNote'] as String?,
      calendarId: json['calendarId'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isTrial: json['isTrial'] as bool?,
      convertedLesson: json['convertedLesson'] as int?,
      scheduleDetailInfo: json['scheduleDetailInfo'] == null
          ? null
          : ScheduleDetailInfoModel.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookingInfoModelToJson(_$_BookingInfoModel instance) =>
    <String, dynamic>{
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'id': instance.id,
      'userId': instance.userId,
      'scheduleDetailId': instance.scheduleDetailId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
      'googleMeetLink': instance.googleMeetLink,
      'studentRequest': instance.studentRequest,
      'tutorReview': instance.tutorReview,
      'scoreByTutor': instance.scoreByTutor,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'recordUrl': instance.recordUrl,
      'cancelReasonId': instance.cancelReasonId,
      'lessonPlanId': instance.lessonPlanId,
      'cancelNote': instance.cancelNote,
      'calendarId': instance.calendarId,
      'isDeleted': instance.isDeleted,
      'isTrial': instance.isTrial,
      'convertedLesson': instance.convertedLesson,
      'scheduleDetailInfo': instance.scheduleDetailInfo,
    };

_$_ScheduleDetailInfoModel _$$_ScheduleDetailInfoModelFromJson(
        Map<String, dynamic> json) =>
    _$_ScheduleDetailInfoModel(
      startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
      id: json['id'] as String?,
      scheduleId: json['scheduleId'] as String?,
      startPeriod: json['startPeriod'] as String?,
      endPeriod: json['endPeriod'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      scheduleInfo: json['scheduleInfo'] == null
          ? null
          : ScheduleInfoModel.fromJson(
              json['scheduleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScheduleDetailInfoModelToJson(
        _$_ScheduleDetailInfoModel instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'scheduleInfo': instance.scheduleInfo,
    };

_$_ScheduleInfoModel _$$_ScheduleInfoModelFromJson(Map<String, dynamic> json) =>
    _$_ScheduleInfoModel(
      date: json['date'] as String?,
      startTimestamp: json['startTimestamp'] as int?,
      endTimestamp: json['endTimestamp'] as int?,
      id: json['id'] as String?,
      tutorId: json['tutorId'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      tutorInfo: json['tutorInfo'] == null
          ? null
          : TutorModel.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScheduleInfoModelToJson(
        _$_ScheduleInfoModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'tutorInfo': instance.tutorInfo,
    };

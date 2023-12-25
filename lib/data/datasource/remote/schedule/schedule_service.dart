import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/schedule/booking_class_response.dart';
import 'package:let_tutor/data/models/schedule/cancel_booked_response.dart';
import 'package:let_tutor/data/models/schedule/schedule_response.dart';
import 'package:let_tutor/data/models/schedule/upcoming_class_response.dart';
import 'package:retrofit/http.dart';

part 'schedule_service.g.dart';

@RestApi()
@injectable
abstract class ScheduleService {
  static const String bookingApi = '/booking';
  static const String scheduleApi = '/schedule';
  static const String bookedClassesApi = '/booking/list/student';
  static const String upcomingClassesApi = '/booking/next';

  @factoryMethod
  factory ScheduleService(Dio dio) = _ScheduleService;

  @POST(bookingApi)
  Future<void> postBookAClass({@Body() required Map<String, dynamic> body});

  @POST(scheduleApi)
  Future<ScheduleResponse?> getScheduleByTutorID(
      {@Body() required Map<String, dynamic> body});

  @DELETE(bookingApi)
  Future<CancelBookedResponse?> cancelBookedClass(
      {@Body() required Map<String, dynamic> body});

  @GET(bookedClassesApi)
  Future<BookingClassResponse?> getBookedClass({
    @Path("page") required int page,
    @Path("perPage") required int perPage,
    @Path("dateTimeLte") required int dateTimeLte,
    @Path("orderBy") required String orderBy,
    @Path("sortBy") required String sortBy,
  });

  @GET(upcomingClassesApi)
  Future<UpcomingClassResponse?> upcomingClasses({
    @Path("dateTime") required int dateTime,
  });
}

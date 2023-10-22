import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/schedule/booking_class_response.dart';
import 'package:let_tutor/data/models/schedule/schedule_response.dart';
import 'package:retrofit/http.dart';

part 'schedule_service.g.dart';

@RestApi()
@injectable
abstract class ScheduleService {
  static const String bookingApi = '/booking';
  static const String scheduleApi = '/schedule';
  static const String bookedClasses = '/booking/list/student';

  @factoryMethod
  factory ScheduleService(Dio dio) = _ScheduleService;

  // @POST(bookingApi)
  // Future<TutorsResponse?> postBookAClass(
  //     {@Body() required Map<String, dynamic> body});

  @POST(scheduleApi)
  Future<ScheduleResponse?> getScheduleByTutorID(
      {@Body() required Map<String, dynamic> body});

  @DELETE(bookingApi)
  Future<String?> cancelBookedClass(
      {@Body() required Map<String, dynamic> body});

  @GET(bookedClasses)
  Future<BookingClassResponse?> getBookedClass({
    @Path("page") required int page,
    @Path("perPage") required int perPage,
    @Path("dateTimeLte") required int dateTimeLte,
    @Path("orderBy") required String orderBy,
    @Path("sortBy") required String sortBy,
  });
}

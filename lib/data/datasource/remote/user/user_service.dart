import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/models/user_model.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

class UserServiceEndPoint {
  static const String getUserInfo = '/user/info';
}

@RestApi()
@injectable
abstract class UserService {
  @factoryMethod
  factory UserService(Dio dio) = _UserService;

  @GET(UserServiceEndPoint.getUserInfo)
  Future<UserModel> getUserInformation();
}

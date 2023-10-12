import 'package:let_tutor/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUserInfo();
  Future<User?> editUserProfile({required Map<String, dynamic> body});
}

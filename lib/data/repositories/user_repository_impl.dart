import 'package:let_tutor/data/datasource/remote/user/user_service.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/repositories/user_repository.dart';

class UserRepositoryImplement extends UserRepository {
  final UserService _userService;
  UserRepositoryImplement(this._userService);

  @override
  Future<User> getUserInfo() async {
    final res = await _userService.getUserInformation();
    return res.toEntity();
  }
}

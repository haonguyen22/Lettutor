import 'package:injectable/injectable.dart';
import 'package:let_tutor/data/datasource/remote/user/user_service.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImplement extends UserRepository {
  final UserService _userService;
  UserRepositoryImplement(this._userService);

  @override
  Future<User> getUserInfo() async {
    final res = await _userService.getUserInformation();
    return res.toEntity();
  }

  @override
  Future<User?> editUserProfile({required Map<String, dynamic> body}) async {
    try {
      final res = await _userService.updateUserInformation(body: body);
      return res.user.toEntity();
    } catch (e) {
      return null;
    }
  }
}

import 'package:injectable/injectable.dart';
import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/repositories/user_repository.dart';

@injectable
class UserUseCase {
  final UserRepository _userRepository;

  const UserUseCase(this._userRepository);

  Future<User?> getUserInfo() async {
    final res = await _userRepository.getUserInfo();
    return res;
  }

  Future<User?> editUserProfile({required Map<String, dynamic> body}) async {
    final res = await _userRepository.editUserProfile(body: body);
    return res;
  }
}

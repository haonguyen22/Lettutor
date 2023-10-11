import 'package:let_tutor/domain/entities/user.dart';
import 'package:let_tutor/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _userRepository;

  const UserUseCase(this._userRepository);
  
  Future<User> getUserInfo() async  {
    final res = await _userRepository.getUserInfo();
    return res;
  }
}
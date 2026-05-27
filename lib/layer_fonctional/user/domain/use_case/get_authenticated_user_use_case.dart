import 'package:start_it_up/layer_fonctional/user/data/repository/user_repository.dart';

import '../entity/user.dart';

class GetAuthenticatedUserUseCase {
  final UserRepository _userRepository;

  const GetAuthenticatedUserUseCase({required UserRepository userRepository})
    : _userRepository = userRepository;

  Future<User> execute() async {
    // ignore: unused_local_variable
    final uselessButLaterWillBeUserful = _userRepository;

    await Future.delayed(const Duration(seconds: 1));
    return User.faker();
  }
}

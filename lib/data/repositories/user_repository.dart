import '../models/user.dart';
import '../services/service.dart';

class UserRepository {
  final IService service;

  const UserRepository({required this.service});

  Future<(User, String, String)> doLogin({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> response = await service.post(
      '/users/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    return (
      User.fromJson(
        response['user'],
      ),
      response['token'] as String,
      response['refreshToken'] as String,
    );
  }
}

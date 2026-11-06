import 'package:econoris_app/data/models/users/user_dto.dart';
import 'package:econoris_app/data/models/users/user_dto_mapper.dart';
import 'package:econoris_app/data/repositories/users/user_repository.dart';
import 'package:econoris_app/data/repositories/users/user_repository_remote.dart';
import 'package:econoris_app/data/services/auth/auth_manager.dart';
import 'package:econoris_app/domain/models/users/user.dart';
import 'package:flutter/widgets.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required this.remote, required this.authNotifier});

  final UserRepositoryRemote remote;
  final AuthManager authNotifier;

  /// Fails when the server does not answer: the profile screen then shows an error
  /// instead of a made-up user.
  @override
  Future<User> getCurrentUser() async {
    try {
      final UserDto userDto = await remote.getCurrentUser();
      return userDto.toDomain();
    } catch (e) {
      debugPrint('UserRepositoryImpl: Fetching user failed : error $e');
      throw Exception('Failed to fetch user');
    }
  }

  @override
  Future<void> updatePseudo(String newPseudo) async {
    try {
      await remote.updatePseudo(newPseudo);
    } catch (e) {
      debugPrint('UserRepositoryImpl: Updating pseudo failed : error $e');
      throw Exception('Failed to update pseudo');
    }
  }

  @override
  Future<void> logoutAll() async {
    try {
      await remote.logoutAll();
      await authNotifier.logout();
    } catch (e) {
      debugPrint(
        'UserRepositoryImpl: Logout from all devices failed : error $e',
      );
      throw Exception('Failed to logout from all devices');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await authNotifier.logout();
    } catch (e) {
      debugPrint('UserRepositoryImpl: Logout failed : error $e');
      throw Exception('Failed to logout');
    }
  }
}

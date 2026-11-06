import 'package:econoris_app/data/repositories/auth/auth_repository.dart';
import 'package:econoris_app/data/repositories/auth/auth_repository_local.dart';
import 'package:econoris_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:econoris_app/data/services/auth/auth_manager.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.globalAuthNotifier,
  });

  final AuthRepositoryRemote remote;
  final AuthRepositoryLocal local;
  final AuthManager globalAuthNotifier;

  @override
  /// Requests a login code for the given email, saves the email and token locally.
  Future<void> requestLoginCode(String email) async {
    try {
      /* Save email in local storage */
      await local.saveEmail(email);

      /* Call API to request login code */
      final String token = await remote.requestLoginCode(email);

      /* Save the login token in local storage */
      await local.saveLoginToken(token);
    } catch (error) {
      throw Exception('Failed to request login code');
    }
  }

  @override
  /// Confirms the login code with the given secret, retrieves the JWT token, and updates the global auth state.
  Future<bool> confirmLoginCode(String secret) async {
    try {
      final String email = await local.getEmail() ?? '';
      final String token = await local.getLoginToken() ?? '';
      final String jwt = await remote.confirmLoginCode(email, token, secret);
      await globalAuthNotifier.setAuthenticated(jwt);

      /* Useless once the user is logged in. It is kept after a wrong code, so that the user can try again */
      await local.deleteLoginToken();

      return true;
    } catch (_) {
      throw Exception('Failed to confirm login code');
    }
  }

  @override
  /// Retrieves the email from local storage.
  Future<String?> getEmail() async {
    try {
      return await local.getEmail();
    } catch (_) {
      throw Exception('Failed to get email 1');
    }
  }
}

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoryu_dev/util/logger.dart';

final currentUserProvider = FutureProvider(
  (_) => Amplify.Auth.getCurrentUser(),
);

class AuthController {
  AuthCategory get _auth => Amplify.Auth;

  Future<void> signUp({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _auth.signUp(
        username: username,
        password: password,
      );
    } on AuthException catch (e) {
      final message = e.message;
      final underlyingException = e.underlyingException;
      final recoverySuggestion = e.recoverySuggestion;
      logger.warning(
        '''AuthException:
          message: $message
          underlyingException: $underlyingException
          recoverySuggestion: $recoverySuggestion''',
      );
    }
  }
}

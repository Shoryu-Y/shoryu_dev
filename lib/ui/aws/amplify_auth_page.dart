import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:shoryu_dev/colors.dart';
import 'package:shoryu_dev/ui/aws/amplify_home_page.dart';

class AmplifyAuthPage extends StatelessWidget {
  const AmplifyAuthPage({super.key});

  static const routePath = '/amplify_auth';

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      signInForm: SignInForm.custom(
        fields: [
          SignInFormField.username(),
          SignInFormField.password(),
        ],
      ),
      signUpForm: SignUpForm.custom(
        fields: [
          SignUpFormField.email(required: true),
          SignUpFormField.password(),
        ],
      ),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: appBrand,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(centerTitle: true),
        ),
        builder: Authenticator.builder(),
        home: const AmplifyHomePage(),
      ),
    );
  }
}

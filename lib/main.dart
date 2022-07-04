import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoryu_dev/amplifyconfiguration.dart';
import 'package:shoryu_dev/colors.dart';
import 'package:shoryu_dev/provider/providers.dart';
import 'package:shoryu_dev/util/logger.dart';

Future<void> _initFirebase() async {
  try {
    await Firebase.initializeApp();
  } on Exception catch (e) {
    logger.warning('Firebase init Error: $e');
  }
}

Future<void> _initAmplify() async {
  final auth = AmplifyAuthCognito();
  // AmplifyStorageS3 storage = AmplifyStorageS3();
  // AmplifyAnalyticsPinpoint analytics = AmplifyAnalyticsPinpoint();
  //
  await Amplify.addPlugins([auth]);

  try {
    await Amplify.configure(amplifyconfig);
    logger.info('Amplify is Configured🎉');
  } on AmplifyAlreadyConfiguredException catch (e) {
    logger.warning('Amplify is Already Configured Error: $e');
  } on AmplifyException catch (e) {
    logger.warning('Amplify Error: $e');
  } on Exception catch (e) {
    logger.warning('other Error: $e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    _initFirebase(),
    _initAmplify(),
  ]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: appBrand,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}

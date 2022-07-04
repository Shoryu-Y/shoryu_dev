import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoryu_dev/ui/aws/controller/auth_controller.dart';

class AmplifyHomePage extends ConsumerWidget {
  const AmplifyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SignOutButton(),
              currentUser.when(
                data: (data) {
                  final username = data.username;
                  final userId = data.userId;
                  return Text('name: $username\nid: $userId');
                },
                error: (error, stackTrace) {
                  return const SizedBox();
                },
                loading: () {
                  return const Text('読み込み中...');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatelessWidget {
  const SharedPreferencesPage({super.key});

  static const routePath = '/pref';

  Future<void> setSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('keykey', 'valuevalue');
  }

  Future<String> getSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    final str = pref.getString('keykey');
    return str ?? '';
  }

  Future<void> setSecureStorage() async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'keykey', value: 'valuevalue');
  }

  Future<String> getSecureStorage() async {
    const secureStorage = FlutterSecureStorage();
    final str = await secureStorage.read(key: 'keykey');
    return str ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared_preferences'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('key: "keykey"'),
            const Text('value: "valuevalue"'),
            OutlinedButton(
              onPressed: setSharedPreferences,
              child: const Text('save pref'),
            ),
            OutlinedButton(
              onPressed: setSecureStorage,
              child: const Text('save pref'),
            ),
          ],
        ),
      ),
    );
  }
}

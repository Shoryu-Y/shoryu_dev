import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LocalStoragePage extends StatelessWidget {
  const LocalStoragePage({super.key});

  Future<String> getLibraryDirectoryPath() async {
    final dir = await getApplicationSupportDirectory();
    final path = dir.path;
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared_preferences'),
      ),
      body: Column(
        children: const [
          Text('key: "keykey"'),
          Text('value: "valuevalue"'),
        ],
      ),
    );
  }
}

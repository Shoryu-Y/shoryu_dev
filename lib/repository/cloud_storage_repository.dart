import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class CloudStorageRepository {
  final _storage = FirebaseStorage.instance;

  Future<void> uploadVideo(Uint8List data) async {
    final ref = _storage.ref().child('videos').child('video.mp4');
    await ref.putData(data);
  }
}

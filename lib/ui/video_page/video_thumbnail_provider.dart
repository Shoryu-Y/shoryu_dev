import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final thumbnailProvider = FutureProvider.family<Uint8List?, String>(
  (_, path) => _VideoThumbnailController.createThumbnailFromVideo(path),
);

class _VideoThumbnailController {
  const _VideoThumbnailController();

  static Future<Uint8List?> createThumbnailFromVideo(String url) async {
    final thumbnail = await VideoThumbnail.thumbnailData(video: url);
    return thumbnail;
  }
}

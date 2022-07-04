import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoryu_dev/ui/video_page/video_thumbnail_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  static const routePath = '/video';

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  static const assetPath = 'assets/videos/sample.mp4';
  static const networkPath =
      'https://firebasestorage.googleapis.com/v0/b/development-c66cb.appspot.com/o/videos%2Fsample.mp4?alt=media&token=05d35e4e-d5bd-4bed-b78e-3175c1e1410c';

  late final VideoPlayerController _assetVideoController;
  late final VideoPlayerController _netVideoController;

  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _assetVideoController = VideoPlayerController.asset(assetPath);
    _netVideoController = VideoPlayerController.network(networkPath);
    Future.wait([
      _assetVideoController.initialize(),
      _netVideoController.initialize(),
    ]).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerView(controller: _netVideoController, title: 'NetWork'),
            VideoPlayerView(controller: _assetVideoController, title: 'Asset'),
            Text('Thumbnail', style: Theme.of(context).textTheme.headline6),
            const VideoThumbnailView(path: networkPath),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.controller,
    required this.title,
  });

  final VideoPlayerController controller;
  final String title;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  bool isLoop = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.headline6),
        AspectRatio(
          aspectRatio: widget.controller.value.aspectRatio,
          child: VideoPlayer(widget.controller),
        ),
        Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => widget.controller.play(),
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () => widget.controller.pause(),
              ),
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: isLoop ? Colors.lightBlue : null,
                ),
                onPressed: () {
                  widget.controller.setLooping(!isLoop);
                  setState(() {
                    isLoop = !isLoop;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VideoThumbnailView extends ConsumerWidget {
  const VideoThumbnailView({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(thumbnailProvider(path));

    return res.when(
      data: (data) {
        if (data == null) {
          return const Text('読み込みに失敗しました');
        }
        return Image.memory(data);
      },
      error: (_, __) {
        return const Text('読み込みに失敗しました');
      },
      loading: () => const Text('読み込み中'),
    );
  }

  Future<Uint8List> createImageFromVideo() async {
    const path =
        'https://firebasestorage.googleapis.com/v0/b/development-c66cb.appspot.com/o/videos%2Fsample.mp4?alt=media&token=05d35e4e-d5bd-4bed-b78e-3175c1e1410c';
    final thumbnail = await VideoThumbnail.thumbnailData(video: path);
    await save(thumbnail!);
    return thumbnail;
  }

  Future<void> save(Uint8List bytes) async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('video_thumbnail.png');
    await ref.putData(bytes);
  }
}

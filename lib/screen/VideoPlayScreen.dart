import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class VideoPlayScreen extends StatefulWidget {
  @override
  VideoPlayScreenStatus createState() => VideoPlayScreenStatus();
}

class VideoPlayScreenStatus extends State<VideoPlayScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      // DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => isVideoReady()
            ? AspectRatio(
          aspectRatio: constraints.maxWidth / constraints.maxHeight,
          // _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
    );
  }

  bool isVideoReady() {
    if (_controller==null) {
      return false;
    }
    return _controller.value.isInitialized;
  }

  @override
  void dispose() {
    _controller.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  Future<void> initializeVideoPlayer() async {
    bool ret = await _getStatuses();
    if (!ret) {
      return null;
    }

    // FilePickerResult result = await FilePicker.platform.pickFiles();
    // if (result == null) {
    //   return;
    // }
    // File file = File(result.files.single.path);
    // _controller = VideoPlayerController.file(file);

    // todo : picker는 초기 1회만 얻어오고 이후로는 결과만 가지고 재생
    String filename = "/data/user/0/com.example.netflix_ui/cache/file_picker/[VR] ITZY 'WANNABE' VR CAM │@SBS Inkigayo_2020.4.5 [0rDz0x1mCb4].webm";
    _controller = VideoPlayerController.file(File(filename));

    await Future.wait( [_controller.initialize()] );
    setState(() {
      _controller.play();
    });
  }

  Future<bool> _getStatuses() async {
    Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

    if (await Permission.storage.isGranted) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
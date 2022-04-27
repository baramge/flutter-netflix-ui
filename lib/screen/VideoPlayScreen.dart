import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:external_path/external_path.dart';

class VideoPlayScreen extends StatefulWidget {
  @override
  VideoPlayScreenStatus createState() => VideoPlayScreenStatus();
}

class VideoPlayScreenStatus extends State<VideoPlayScreen> {
  VideoPlayerController _controller;
  List<String> _exPath = [];

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // body: ,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> initializeVideoPlayer() async {
    bool ret = await _getStatuses();
    if (!ret) {
      return null;
    }

    Directory dir = await getTemporaryDirectory();
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }

    // await getPath();
    // await getPublicDirectoryPath();

    File file = File(result.files.single.path);
    _controller = VideoPlayerController.file(file);

    await Future.wait( [_controller.initialize()] );
    setState(() {
      _controller.play();
    });
  }

  Future<bool> _getStatuses() async {
    Map<Permission, PermissionStatus> statuses =
    await [Permission.storage].request();

    if (await Permission.storage.isGranted) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

// Get storage directory paths
  // Like internal and external (SD card) storage path
  // Future<void> getPath() async {
  //   List<String> paths;
  //   // getExternalStorageDirectories() will return list containing internal storage directory path
  //   // And external storage (SD card) directory path (if exists)
  //   paths = await ExternalPath.getExternalStorageDirectories();
  //
  //   setState(() {
  //     _exPath = paths; // [/storage/emulated/0, /storage/B3AE-4D28]
  //   });
  // }
  //
  // // To get public storage directory path like Downloads, Picture, Movie etc.
  // // Use below code
  // Future<void> getPublicDirectoryPath() async {
  //   String path;
  //
  //   path = await ExternalPath.getExternalStoragePublicDirectory(
  //       ExternalPath.DIRECTORY_DOWNLOADS);
  //
  //   setState(() {
  //     print(path); // /storage/emulated/0/Download
  //   });
  // }
}
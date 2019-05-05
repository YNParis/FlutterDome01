import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CameraResult extends StatefulWidget {
  CameraResult(this.imagePath, this.videoPath);

  String imagePath;
  String videoPath;

  @override
  State<StatefulWidget> createState() {
    return CameraResultState();
  }
}

class CameraResultState extends State<CameraResult> {
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;

  @override
  void initState() {
    super.initState();
    _startVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预览'),
      ),
      body: Container(
          alignment: Alignment.center,
          width: 300.0,
          height: 300.0,
          child: Hero(
              tag: 'cameraResult',
              child: widget.imagePath != null
                  ? Image.file(File(widget.imagePath))
                  : Container(
                      child: Center(
                        child: AspectRatio(
                            aspectRatio: 1.0,
                            child: VideoPlayer(videoController)),
                      ),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                    ))),
    );
  }

  Future<void> _startVideoPlayer() async {
    final vcontroller = VideoPlayerController.file(File(widget.videoPath));
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        if (mounted) setState(() {});
        videoController.removeListener(videoPlayerListener);
      }
    };
    vcontroller.addListener(videoPlayerListener);
    await vcontroller.setLooping(true);
    await vcontroller.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        videoController = vcontroller;
      });
    }
    await vcontroller.play();
  }

  
}

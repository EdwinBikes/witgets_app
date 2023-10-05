import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  static const name = 'video_view_screen';
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isVideoLoaded = false;
  bool _isVideoPlaying = false;
  bool _isOverlayVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> pickAndPlayVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );
    File? file;

    if (result != null && result.files.isNotEmpty) {
      file = File(result.files.single.path!);
    } else {
      // Manejo de error o valor predeterminado si result es nulo o la lista de archivos está vacía.
    }

    if (file != null) {
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          setState(() {
            _isVideoLoaded = true;
          });
          _controller.play();
        });
    } else {
      // Manejo de error o valor predeterminado si 'file' es nulo.
    }
  }

  void toggleVideoPlayback() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isVideoPlaying = false;
      } else {
        _controller.play();
        _isVideoPlaying = true;
      }
    });
  }

  void showOverlay() {
    setState(() {
      _isOverlayVisible = true;
    });
  }

  void hideOverlay() {
    setState(() {
      _isOverlayVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Video'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _isVideoLoaded
                ? GestureDetector(
                    onTap: toggleVideoPlayback,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const Text('Selecciona un video para reproducir.'),
            if (_isOverlayVisible)
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: _isVideoPlaying
                      ? IconButton(
                          icon: const Icon(Icons.pause),
                          onPressed: toggleVideoPlayback,
                        )
                      : IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: toggleVideoPlayback,
                        ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          hideOverlay(); // Oculta el overlay al cambiar de video.
          pickAndPlayVideo();
        },
        tooltip: 'Seleccionar y Reproducir Video',
        child: const Icon(Icons.video_library),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

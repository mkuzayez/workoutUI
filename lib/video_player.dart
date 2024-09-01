// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class ExerciseVideo extends StatefulWidget {
//   const ExerciseVideo({super.key});

//   @override
//   State<ExerciseVideo> createState() => _ExerciseVideoState();
// }

// class _ExerciseVideoState extends State<ExerciseVideo> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();

//     _controller = VideoPlayerController.asset("assets/push-up.mp4");
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           );
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

enum Source { asset, network }

class ExerciseVideoAppinio extends StatefulWidget {
  const ExerciseVideoAppinio({super.key});

  @override
  State<ExerciseVideoAppinio> createState() => _ExerciseVideoAppinioState();
}

class _ExerciseVideoAppinioState extends State<ExerciseVideoAppinio> {
  late CustomVideoPlayerController _customVideoPlayerController;

  Source currentSource = Source.asset;

  String assetVideoPath = "assets/push-up.mp4";

  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(currentSource);
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
                
              ],
            ),
    );
  }



  void initializeVideoPlayer(Source source) {
    setState(() {
      isLoading = true;
    });
    VideoPlayerController videoPlayerController;

    videoPlayerController = VideoPlayerController.asset(assetVideoPath)
      ..initialize().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }
}

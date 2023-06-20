import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wakelock/wakelock.dart';

class VideoContentWidget extends StatefulWidget {
  final String videoURL;
  final String closeIconURL;

  const VideoContentWidget(
      {super.key, required this.videoURL, required this.closeIconURL});

  @override
  State<VideoContentWidget> createState() => _VideoContentWidgetState();
}

class _VideoContentWidgetState extends State<VideoContentWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Wakelock.enable();
    _controller = VideoPlayerController.network(
      widget.videoURL,
    );

    _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
        showControlsOnInitialize: true,
        allowFullScreen: true,
        allowedScreenSleep: false);

    _initializeVideoPlayerFuture =
        _controller.initialize().then((value) => _controller.play());

  }

  @override
  void dispose() {
    _controller.dispose();
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Chewie(controller: _chewieController);
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30),
                  child: InkWell(
                    child: Image.asset(
                      'assets/exit.png',
                      height:  50,
                      width:  50,
                    ),
                    // child: CachedNetworkImage( this is for netwrok image
                    //   imageUrl: widget.closeIconURL,
                    //   height:  50,
                    //   width:  50,
                    // ),
                    onTap: () {
                      Navigator. of(context). pop();
                      // navigationService.pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:player_video/Screens/GlobalVar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
   late VideoPlayerController videoPlayerController;
   late ChewieController chewieController;

  loadVideo() async {

    videoPlayerController = VideoPlayerController.asset("${GlobalVar.l}");
    await videoPlayerController.initialize();
    setState(() {});
    chewieController = ChewieController(
      useRootNavigator: true,
        videoPlayerController: videoPlayerController,
    );
  }

  @override
  void initState() {
    super.initState();
    loadVideo();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    videoPlayerController = VideoPlayerController.asset(data['video']);

    chewieController = ChewieController(
      useRootNavigator: true,
      videoPlayerController: videoPlayerController,
      fullScreenByDefault: true,
      autoPlay: true,
      deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeRight],
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      // allowFullScreen: true,
    );


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Page",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

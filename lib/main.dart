import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:player_video/Screens/GlobalVar.dart';
import 'package:video_player/video_player.dart';

import 'Screens/DetailPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      'detail': (context) => const DetailPage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: GlobalVar.l.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, 'detail',
                    arguments: GlobalVar.l[i]);
              });
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal,
                image: DecorationImage(
                    image: Image.asset("${GlobalVar.l[i]['image']}").image,
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:socialtec/models/popular_model.dart';
import 'package:socialtec/network/api_popular.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.popularModel});

  final PopularModel popularModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ApiPopular? apiPopular;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    apiPopular = ApiPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.popularModel.originalTitle!),
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: apiPopular!.getVideo(widget.popularModel.id!),
                builder: (context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.hasData) {
                    //return Container(child: Text(snapshot.data!));
                    return YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: snapshot.data!,
                        flags: const YoutubePlayerFlags(autoPlay: false),
                      ),
                      showVideoProgressIndicator: true,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ));
  }
}

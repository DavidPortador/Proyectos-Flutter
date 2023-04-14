import 'dart:ui';

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
    bool ban = false;
    var fav = Icon(Icons.favorite_outline_rounded);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.popularModel.originalTitle!),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  fav = Icon(Icons.favorite_rounded);
                });
              },
              icon: fav,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${widget.popularModel.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Column(children: [
                  FutureBuilder(
                      future: apiPopular!.getVideo(widget.popularModel.id!),
                      builder: (context, AsyncSnapshot<String?> snapshot) {
                        if (snapshot.hasData) {
                          //return Container(child: Text(snapshot.data!));
                          if (snapshot.data == "") {
                            return Container(
                              height: 200.0,
                              child: const Center(
                                  child: Text("Pelicula sin trailer :(")),
                            );
                          } else {
                            return YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: snapshot.data!,
                                flags:
                                    const YoutubePlayerFlags(autoPlay: false),
                              ),
                              showVideoProgressIndicator: true,
                            );
                          }
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Popularity: ${widget.popularModel.popularity!}",
                            //textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              height: 20.0,
                              alignment: Alignment.center,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    (widget.popularModel.popularity! / 1000)
                                            .toInt() +
                                        1,
                                itemBuilder: (context, index) {
                                  var ico;
                                  if (index ==
                                      (widget.popularModel.popularity! / 1000)
                                          .toInt()) {
                                    ico = Icons.star_half;
                                  } else {
                                    ico = Icons.star;
                                  }
                                  return Icon(
                                    ico,
                                    color: Colors.yellow,
                                    size: 24.0,
                                  );
                                },
                              )),
                          Text(
                            "Descripcion: \n${widget.popularModel.overview!}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder(
                              future:
                                  apiPopular!.getCast(widget.popularModel.id!),
                              builder: (context,
                                  AsyncSnapshot<List<dynamic>?> snapshot) {
                                if (snapshot.hasData) {
                                  //return Container(child: Text(snapshot.data!));
                                  if (snapshot.data == null) {
                                    return Container(
                                      height: 200.0,
                                      child: const Center(
                                          child: Text(
                                              "No se pudo cargar el cast :(")),
                                    );
                                  } else {
                                    return Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        height: 200,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data!.length < 11
                                              ? snapshot.data!.length
                                              : 10,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width: 100.0,
                                              color: Colors.deepPurple,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${snapshot.data![index]['character']}",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                        shadows: [
                                                          Shadow(
                                                            color: Colors.black,
                                                            offset:
                                                                Offset(2, 2),
                                                            blurRadius: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FadeInImage(
                                                        fit: BoxFit.fill,
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/customs/loading.gif'),
                                                        width: 100,
                                                        image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w500${snapshot.data![index]['profile_path']}')),
                                                    Text(
                                                      snapshot.data![index]
                                                          ['name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ));
                                  }
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ]),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

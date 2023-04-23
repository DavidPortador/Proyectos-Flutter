import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:socialtec/models/popular_model.dart';
import 'package:socialtec/network/api_popular.dart';
import 'package:socialtec/database/database_movies.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovilScreen extends StatefulWidget {
  const DetailMovilScreen({super.key, required this.popularModel, required this.favorite});

  final PopularModel popularModel;
  final bool favorite;

  @override
  State<DetailMovilScreen> createState() => _DetailMovilScreenState();
}

class _DetailMovilScreenState extends State<DetailMovilScreen> {
  ApiPopular? apiPopular;
  DatabaseMovies? database;

  @override
  void initState() {
    apiPopular = ApiPopular();
    database = DatabaseMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fav;
    widget.favorite
      ? fav = const Icon(
          Icons.favorite_rounded,
          color: Colors.redAccent,
        )
      : fav = const Icon(Icons.favorite_outline_rounded);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.popularModel.originalTitle!),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                if (widget.favorite) {
                  setState(() {
                    database!.DELETE('tblMovies', widget.popularModel.id!)
                        .then((value) {
                      print('favorito borrado');
                    });
                    Navigator.pop(context);
                  });
                } else {
                  setState(() {
                    database!.INSERT('tblMovies',
                        {'idMovie': widget.popularModel.id!}).then((value) {
                      print('favorito insertado');
                    });
                    Navigator.pop(context);
                  });
                }
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
                              child: const Center(child: Text("Pelicula sin trailer :(")),
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
                          return const Center(child: CircularProgressIndicator());
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Popularidad: ${widget.popularModel.popularity!}",
                            style: const TextStyle(
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
                                    widget.popularModel.popularity! ~/ 1000 + 1,
                                itemBuilder: (context, index) {
                                  IconData ico;
                                  if (index == widget.popularModel.popularity! ~/ 1000) {
                                    ico = Icons.star_half;
                                  } else {
                                    ico = Icons.star;
                                  }
                                  return Icon(
                                    ico,
                                    shadows: const <Shadow>[
                                      Shadow(
                                          color: Colors.black, blurRadius: 15.0)
                                    ],
                                    color: Colors.yellow,
                                    size: 24.0,
                                  );
                                },
                              )),
                          const SizedBox(height: 5),
                          const Text(
                            "Descripcion: ",
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
                          Text(
                            widget.popularModel.overview!,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 14,
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
                          const SizedBox(height: 5),
                          const Text(
                            "Reparto:",
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
                                        height: 160,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data!.length < 11
                                              ? snapshot.data!.length
                                              : 10,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Container(
                                                width: 130.0,
                                                //color: Colors.deepPurple.shade500.withOpacity(0.7),
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .deepPurple.shade500
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 8, 5, 3),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "${snapshot.data![index]['character']}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          shadows: [
                                                            Shadow(
                                                              color:
                                                                  Colors.black,
                                                              offset:
                                                                  Offset(2, 2),
                                                              blurRadius: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.deepPurple,
                                                        radius: 50,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                'https://image.tmdb.org/t/p/w500${snapshot.data![index]['profile_path']}'),
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            ['name'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
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

import 'package:flutter/material.dart';
import 'package:socialtec/database/database_movies.dart';
import 'package:socialtec/models/movie_model.dart';
import 'package:socialtec/models/popular_model.dart';
import 'package:socialtec/network/api_popular.dart';
import 'package:socialtec/screens/movies/widgets/item_popular.dart';

class ListFavorite extends StatefulWidget {
  const ListFavorite({super.key});

  @override
  State<ListFavorite> createState() => _ListFavoriteState();
}

class _ListFavoriteState extends State<ListFavorite> {
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
    return Scaffold(
      appBar: AppBar(
          title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('List Favorites Movies '),
          Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
        ],
      )),
      // body: FutureBuilder(
      //   future: apiPopular!.getAllPopular(),
      //   builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
      //     if (snapshot.hasData) {
      //       return GridView.builder(
      //         padding: const EdgeInsets.all(10),
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             childAspectRatio: .9,
      //             mainAxisSpacing: 10,
      //             crossAxisSpacing: 10),
      //         itemCount: snapshot.data != null ? snapshot.data!.length : 0,
      //         itemBuilder: (context, index) {
      //           int id = snapshot.data![index].id!;
      //           return FutureBuilder(
      //               future: database!.valiMovie(id),
      //               builder: (context, AsyncSnapshot<bool> snapshotQuery) {
      //                 if (snapshotQuery.hasData) {
      //                   print("==> ${snapshotQuery.data!}");
      //                   if (snapshotQuery.data!) {
      //                     return ItemPopular(
      //                       popularModel: snapshot.data![index],
      //                       favorite: snapshotQuery.data!,
      //                     );
      //                   } else {
      //                     return const SizedBox.shrink();
      //                   }
      //                 } else {
      //                   return const Center(
      //                     child: Text('Ocurrio un error :('),
      //                   );
      //                 }
      //               });
      //         },
      //       );
      //     } else if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('Ocurrio un error :('),
      //       );
      //     } else {
      //       return const CircularProgressIndicator();
      //     }
      //   }),
      body: FutureBuilder(
        future: database!.GETALLMOVIES(),
        builder: (BuildContext context, AsyncSnapshot snapshotData) {
          return FutureBuilder(
            future: apiPopular!.getAllPopular(),
            builder: (BuildContext context, AsyncSnapshot snapshotApi) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .9,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount:
                    snapshotData.data != null ? snapshotData.data!.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  PopularModel? fav;
                  if (snapshotData.hasData && snapshotApi.hasData) {
                    MovieModel mm = snapshotData.data![index];
                    for (var i = 0; i < snapshotApi.data!.length; i++) {
                      PopularModel pm = snapshotApi.data![i];
                      print('${pm.id} -> ${mm.idMovie}');
                      if (pm.id == mm.idMovie) {
                        fav = pm;
                      }
                    }
                  }
                  return fav!=null 
                  ? ItemPopular(
                    popularModel: fav,
                    favorite: true,
                  )
                  : const Center(child: CircularProgressIndicator());
                },
              );
            },
          );
        },
      ),
    );
  }
}

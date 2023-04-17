import 'package:flutter/material.dart';
import 'package:socialtec/database/database_movies.dart';
import 'package:socialtec/models/popular_model.dart';
import 'package:socialtec/network/api_popular.dart';
import 'package:socialtec/screens/movies/list_favorite.dart';
import 'package:socialtec/screens/movies/widgets/item_popular.dart';

class ListPopular extends StatefulWidget {
  const ListPopular({super.key});

  @override
  State<ListPopular> createState() => _ListPopularState();
}

class _ListPopularState extends State<ListPopular> {
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
        title: const Text('List Popular'),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListFavorite(),
              ),
            ),
            child: Hero(
                tag: 'navigate',
                child: Icon(Icons.format_list_numbered_rounded)),
          )
        ],
      ),
      body: FutureBuilder(
          future: apiPopular!.getAllPopular(),
          builder: (context, AsyncSnapshot<List<PopularModel>?> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  //query
                  /*return ItemPopular(
                  popularModel: snapshot.data![index],
                  favorite: false,
                );*/
                  int id = snapshot.data![index].id!;
                  return FutureBuilder(
                      future: database!.valiMovie(id),
                      builder: (context, AsyncSnapshot<bool> snapshotQuery) {
                        if (snapshotQuery.hasData) {
                          print("==> ${snapshotQuery.data!}");
                          return ItemPopular(
                            popularModel: snapshot.data![index],
                            favorite: snapshotQuery.data!,
                          );
                        } else {
                          return const Center(
                            child: Text('Ocurrio un error :('),
                          );
                        }
                      });
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrio un error :('),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}

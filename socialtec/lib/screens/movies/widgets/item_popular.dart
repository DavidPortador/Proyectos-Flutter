import 'package:flutter/material.dart';
import 'package:socialtec/models/popular_model.dart';
import 'package:socialtec/screens/movies/detail_screen.dart';

class ItemPopular extends StatelessWidget {
  const ItemPopular({super.key, required this.popularModel});

  final PopularModel popularModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: FadeInImage(
          fit: BoxFit.fill,
          placeholder: const AssetImage('assets/customs/loading.gif'),
          image: NetworkImage('https://image.tmdb.org/t/p/w500/${popularModel.posterPath}')
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(popularModel: popularModel),
          ),
        );
      },
    );
  }
}


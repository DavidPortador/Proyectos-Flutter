import 'package:flutter/material.dart';
import 'package:socialtec/models/popular_model.dart';
import 'package:socialtec/screens/movies/detail_screen.dart';

class ItemPopular extends StatelessWidget {
  const ItemPopular(
      {super.key, required this.popularModel, required this.favorite});

  final PopularModel popularModel;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    Color color;
    favorite ? color = Colors.red : color = Colors.grey;
    return InkWell(
      child: Stack(
        children: [
          FadeInImage(
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: const AssetImage('assets/customs/loading.gif'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${popularModel.posterPath}')),
          Icon(
            Icons.favorite,
            shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 15.0)],
            color: color,
            size: 24.0,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(popularModel: popularModel, favorite: favorite),
          ),
        );
      },
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:socialtec/models/popular_model.dart';

class ApiPopular {
  Uri link = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56');

  Future<List<PopularModel>?> getAllPopular() async {
    var result = await http.get(link);
    var listJSON = jsonDecode(result.body)['results'] as List;
    if (result.statusCode == 200) {
      return listJSON.map((popular) => PopularModel.fromMap(popular)).toList();
    }
    return null;
  }

  Future<String?> getVideo(int id) async {
    var result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${id}/videos?api_key=5019e68de7bc112f4e4337a500b96c56"));
    var listJSON = jsonDecode(result.body)['results'] as List;
    if (result.statusCode == 200) {
      //print(listJSON[0]["key"]);
      //return "https://www.youtube.com/watch?v=${listJSON[0]["key"]}";
      return listJSON[0]["key"];
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:socialtec/models/popular_model.dart';

class ApiPopular {
  
  Uri link = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX');

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
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX"));
    var listJSON = jsonDecode(result.body)['results'] as List;
    try {
      if (result.statusCode == 200) {
        return listJSON[0]["key"];
      }else{
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  Future<List<dynamic>?> getCast(int id) async {
    var result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX"));
    var listJSON = jsonDecode(result.body)['cast'] as List;
    try {
      if (result.statusCode == 200) {
        return listJSON;
      }else{
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:socialtec/models/nasa_model.dart';

class ApiNasa {
  Future<List<NasaModel>?> getAll(String tipo) async {
    try {
      print('=> https://api.nasa.gov/EPIC/api/$tipo?api_key=ut9N5GCDqEZI6KTzNkCdFIOtD1hev0cCN1xp2AYs');
      var result = await http.get(Uri.parse(
        '''https://api.nasa.gov/EPIC/api/$tipo?
        api_key=ut9N5GCDqEZI6KTzNkCdFIOtD1hev0cCN1xp2AYs'''
      ));
      var listJSON = jsonDecode(result.body) as List;
      if (result.statusCode == 200) {
        print(listJSON);
        return listJSON.map((natural) => NasaModel.fromMap(natural)).toList();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
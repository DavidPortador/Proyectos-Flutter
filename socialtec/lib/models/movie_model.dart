class MovieModel {
  
  int? idMovie;

  MovieModel({this.idMovie});
  factory MovieModel.fromMap(Map<String,dynamic> map){
    return MovieModel(
      idMovie: map['idMovie']
    );
  }
}
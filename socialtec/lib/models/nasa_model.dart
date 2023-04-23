class NasaModel {
  String? identifier;
  String? caption;
  String? image;
  String? date;

  NasaModel({
    this.identifier,
    this.caption,
    this.image,
    this.date,
  });

  factory NasaModel.fromMap(Map<String, dynamic> map) {
    return NasaModel(
      identifier: map['identifier'],
      caption: map['caption'],
      image: map['image'],
      date: map['date'],
    );
  }
}

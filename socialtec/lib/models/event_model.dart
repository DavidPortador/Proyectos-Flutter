class EventModel {
  int? idEvent;
  String? dscEvent;
  String? dateEvent;
  int? comp;

  EventModel({this.idEvent, this.dscEvent, this.dateEvent, this.comp});
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
        idEvent: map['idEvent'],
        dscEvent: map['dscEvent'],
        dateEvent: map['dateEvent'],
        comp: map['comp']);
  }
}

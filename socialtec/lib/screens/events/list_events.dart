import 'package:flutter/material.dart';
import 'package:socialtec/database/database_events.dart';
import 'package:socialtec/models/event_model.dart';

class ListEvents extends StatefulWidget {
  const ListEvents({super.key});

  @override
  State<ListEvents> createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  DatabaseEvents? database;

  @override
  void initState() {
    super.initState();
    database = DatabaseEvents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database!.GETALLEVENTS(),
      builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var objPostModel = snapshot.data![index];
              print("events -> $objPostModel");
              return Container(
                child: Text(objPostModel.dscEvent!),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ocurrio un error :)'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

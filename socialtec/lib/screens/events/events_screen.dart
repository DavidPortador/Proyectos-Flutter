import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socialtec/database/database_events.dart';
import 'package:socialtec/models/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:async';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

final List<Meeting> meetings = <Meeting>[];
List<Meeting> _getDataSource() {
  return meetings;
}

class _EventsScreenState extends State<EventsScreen> {
  DatabaseEvents? database;

  @override
  void initState() {
    super.initState();
    database = DatabaseEvents();
  }

  String selectedDate = DateTime.now().toString();
  final desc = TextEditingController();
  bool ban = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database!.GETALLEVENTS(),
      builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
        if (snapshot.hasData) {
          print("siuu");
          meetings.removeRange(0, meetings.length);
          for (var i = 0; i < snapshot.data!.length; i++) {
            var objEventModel = snapshot.data![i];
            var desc = objEventModel.dscEvent;
            var da = objEventModel.dateEvent;
            var aux = objEventModel.comp;
            bool comp;

            aux == 1 ? comp = true : comp = false;

            DateTime day = DateFormat("yyyy-MM-dd").parse(da!);
            DateTime now =
                DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
            Color color = getColor(day, now, comp);

            meetings.add(Meeting(desc!, day, day, color, comp));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Calendar Events',
              ),
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListScreen()));
                    },
                    icon: Icon(Icons.list_alt_outlined)),
              ],
            ),
            body: SfCalendar(
              view: CalendarView.month,
              dataSource: MeetingDataSource(_getDataSource()),
              // by default the month appointment display mode set as Indicator, we can
              // change the display mode as appointment using the appointment display
              // mode property
              onTap: (CalendarTapDetails details) {
                //CalendarElement element = details.targetElement;
                //dynamic appointment = details.appointments;
                DateTime date = details.date!;
                print(date.toString());
              },
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await _displayTextInputDialog();
                setState(() {}); // >:'u
              },
              tooltip: 'Add Event',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
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

  Future<void> _displayTextInputDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context2, setState) {
            return AlertDialog(
              title: const Text('New event',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Date: ${selectedDate.split(' ')[0]}",
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          //setState(() {
                          await _selectDate(context2);
                          setState(
                            () {},
                          );
                          //});
                        },
                        icon: const Icon(Icons.edit_calendar),
                      )
                    ],
                  ),
                  TextField(
                    onChanged: (value) {},
                    controller: desc,
                    decoration:
                        const InputDecoration(hintText: "Description: "),
                  ),
                  Row(
                    children: [
                      const Text("Completado: "),
                      Checkbox(
                        value: ban,
                        onChanged: (value) {
                          setState(() {
                            ban = value!;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        database!.INSERT('tblEvents', {
                          'dscEvent': desc.text,
                          'dateEvent': selectedDate.split(' ')[0],
                          'comp': ban ? 1 : 0
                        }).then((value) {
                          print('evento insertado');
                        });
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.add_task),
                    label: const Text("Create")),
              ],
            );
          });
        });
  }

  Color getColor(DateTime day, DateTime now, bool ban) {
    Color color = const Color.fromARGB(255, 109, 93, 93);
    if (day.compareTo(now) < 0) {
      // Event before now
      if (ban) {
        color = const Color.fromARGB(255, 9, 186, 33);
      } else {
        color = const Color.fromARGB(255, 254, 39, 39);
      }
    } else if (day.compareTo(now) == 0) {
      // Event Today
      color = const Color.fromARGB(255, 58, 131, 63);
    } else if (day.compareTo(now) > 0) {
      // Event after now
      final Duration durdef = day.difference(now);
      int diff = durdef.inDays;
      //print("${diff} Days");
      if (diff <= 2) {
        color = const Color.fromARGB(255, 205, 215, 2);
      } else {
        color = const Color.fromARGB(255, 11, 116, 221);
      }
    }
    return color;
  }

  /// calendar chooser
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateFormat("yyyy-MM-dd").parse(selectedDate),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null /*&& picked != selectedDate*/) {
      setState(() {
        selectedDate = picked.toString();
      });
    }
  }
}

class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedDate = DateTime.now().toString();
  final desc = TextEditingController();
  bool ban = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Bob Cholo'),
              accountEmail: Text('bob_cholo@gmail.com'),
              // currentAccountPicture: Image(
              //   image: AssetImage('assets/customs/bob_cholo.png')
              // ),
            ),
            ListTile(
              title: Text('Themes'),
              subtitle: Text('Change your theme here'),
              leading: Icon(Icons.brightness_6_rounded),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                //Navigator.pushNamed(context, '/theme');
              },
            ),
            ListTile(
              title: Text('Titulo 2'),
              subtitle: Text('subtitulo 2'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Calendar Events',
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListScreen()));
              },
              icon: Icon(Icons.list_alt_outlined)),
        ],
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),
        // by default the month appointment display mode set as Indicator, we can
        // change the display mode as appointment using the appointment display
        // mode property
        onTap: (CalendarTapDetails details) {
          //CalendarElement element = details.targetElement;
          //dynamic appointment = details.appointments;
          DateTime date = details.date!;
          print(date.toString());
        },
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _displayTextInputDialog();
          setState(() {}); // >:'u
        },
        tooltip: 'Add Event',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _displayTextInputDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context2, setState) {
            return AlertDialog(
              title: const Text('New event',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Date: ${selectedDate.split(' ')[0]}",
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          //setState(() {
                          await _selectDate(context2);
                          setState(
                            () {},
                          );
                          //});
                        },
                        icon: const Icon(Icons.edit_calendar),
                      )
                    ],
                  ),
                  TextField(
                    onChanged: (value) {},
                    controller: desc,
                    decoration:
                        const InputDecoration(hintText: "Description: "),
                  ),
                  Row(
                    children: [
                      const Text("Completado: "),
                      Checkbox(
                        value: ban,
                        onChanged: (value) {
                          setState(() {
                            ban = value!;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      DateTime day =
                          DateFormat("yyyy-MM-dd").parse(selectedDate);
                      DateTime now = DateFormat("yyyy-MM-dd")
                          .parse(DateTime.now().toString());
                      Color color = getColor(day, now, ban);
                      setState(() {
                        // object meet
                        print(desc.text);
                        print(day.toString());
                        print(color.toString());
                        print(ban);
                        meetings.add(Meeting(desc.text, day, day, color, ban));
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.add_task),
                    label: const Text("Create")),
              ],
            );
          });
        });
  }

  Color getColor(DateTime day, DateTime now, bool ban) {
    Color color = const Color.fromARGB(255, 109, 93, 93);
    if (day.compareTo(now) < 0) {
      // Event before now
      if (ban) {
        color = const Color.fromARGB(255, 9, 186, 33);
      } else {
        color = const Color.fromARGB(255, 254, 39, 39);
      }
    } else if (day.compareTo(now) == 0) {
      // Event Today
      color = const Color.fromARGB(255, 58, 131, 63);
    } else if (day.compareTo(now) > 0) {
      // Event after now
      final Duration durdef = day.difference(now);
      int diff = durdef.inDays;
      //print("${diff} Days");
      if (diff <= 2) {
        color = const Color.fromARGB(255, 205, 215, 2);
      } else {
        color = const Color.fromARGB(255, 11, 116, 221);
      }
    }
    return color;
  }

  /// calendar chooser
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateFormat("yyyy-MM-dd").parse(selectedDate),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null /*&& picked != selectedDate*/) {
      setState(() {
        selectedDate = picked.toString();
      });
    }
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Bob Cholo'),
              accountEmail: Text('bob_cholo@gmail.com'),
              // currentAccountPicture: Image(
              //   image: AssetImage('assets/customs/bob_cholo.png')
              // ),
            ),
            ListTile(
              title: Text('Themes'),
              subtitle: Text('Change your theme here'),
              leading: Icon(Icons.brightness_6_rounded),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                //Navigator.pushNamed(context, '/theme');
              },
            ),
            ListTile(
              title: Text('Titulo 2'),
              subtitle: Text('subtitulo 2'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'List Events',
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.calendar_month_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: _getDataSource().length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            height: 100,
            width: double.infinity,
            color: MeetingDataSource(meetings).getColor(index).withOpacity(0.5),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Event $index: "),
                    Text(MeetingDataSource(meetings).getSubject(index)),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Event details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: MeetingDataSource(meetings)
                                          .getColor(index),
                                      fontWeight: FontWeight.bold)),
                              content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("ID: $index"),
                                    Text(
                                        "DESC: ${MeetingDataSource(meetings).getSubject(index)}"),
                                    Text(
                                        "DATE: ${"${MeetingDataSource(meetings).getEndTime(index)}".split(' ')[0]}"),
                                    Text(
                                        "OVER: ${MeetingDataSource(meetings).isCompleted(index)}"),
                                  ]),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("Close"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.density_medium_rounded)),
                  ]),
            ),
          );
        },
      ),
    );
  }
}

/// collection to the calendar
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isCompleted(int index) {
    return _getMeetingData(index).isCompleted;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }
    return meetingData;
  }
}

/// information about the event data which will be rendered in calendar.
class Meeting {
  Meeting(
      this.eventName, this.from, this.to, this.background, this.isCompleted);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isCompleted;
}

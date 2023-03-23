import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:async';

void main() {
  return runApp(CalendarApp());
}

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatefulWidget {
  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Calendar Demo',
        debugShowCheckedModeBanner: false,
        home: MyHomePage());
  }
}

/// The hove page which hosts the calendar
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
  final List<Meeting> meetings = <Meeting>[];

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
                Navigator.pushNamed(context, '/theme');
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
          'Events',
        ),
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
          setState(() {});
        },
        tooltip: 'Add Event',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Meeting> _getDataSource() {
    return meetings;
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
                      Color color = getColor(day, now);
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

  Color getColor(DateTime day, DateTime now) {
    Color color = const Color.fromARGB(255, 109, 93, 93);
    if (day.compareTo(now) < 0) {
      // Event before now
      color = const Color.fromARGB(255, 254, 39, 39);
    } else if (day.compareTo(now) == 0) {
      // Event Today
      color = const Color.fromARGB(255, 10, 161, 20);
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

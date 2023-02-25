import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                '$contador',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              Text(
                'Contador de clics',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              contador++;
              print('Contador: $contador');
            });
          },
          child: Icon(Icons.add_sharp),
        ),
      ),
    );
  }
}

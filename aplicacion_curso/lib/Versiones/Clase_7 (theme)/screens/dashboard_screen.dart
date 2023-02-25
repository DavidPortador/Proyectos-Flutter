import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social TEC'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pinimg.com/474x/30/04/21/3004214c3132a490eefad066c6da759b.jpg'),
              ),
              accountName: Text('accountName'), 
              accountEmail: Text('accountEmail')
            ),
            ListTile(
              title: Text('hola'),
              subtitle: Text('uwu owo'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            )
          ],
        ),
      ),
    );
  }
}
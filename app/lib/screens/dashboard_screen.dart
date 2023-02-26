import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app/theme_config.dart';

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
              accountName: Text('Luis David García Ramírez'), 
              accountEmail: Text('19030263@itcelaya.edu.mx'),
            ),
            ListTile(
              title: Text('Opción de la lista'),
              subtitle: Text('Detalles del elemento'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ThemeSwitcher.withTheme(
                builder: (_, switcher, theme) {
                  return IconButton(
                    onPressed: () => switcher.changeTheme(
                      theme: theme.brightness == Brightness.light
                          ? darkBlueTheme
                          : lightTheme,
                    ),
                    icon: const Icon(Icons.brightness_3, size: 25),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Aquí va ir todo osi osi'),
      ),
    );
  }
}
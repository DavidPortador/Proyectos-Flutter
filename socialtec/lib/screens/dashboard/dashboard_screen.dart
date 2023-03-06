import 'package:flutter/material.dart';
import 'package:socialtec/settings/responsive.dart';
import 'package:socialtec/components/background.dart';

import 'components/dashboard_body.dart';
import 'components/dashboard_top.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Bob Cholo'),
              accountEmail: Text('bob_cholo@gmail.com'),
              currentAccountPicture: Image(
                image: AssetImage('assets/customs/bob_cholo.png')
              ),
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
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
        ),
      ),
      body: const Background(
        child: SingleChildScrollView(
          child: Responsive(
              mobile: MobileDashboardScreen(),
              desktop: DesktopDashboardScreen()),
        ),
      ),
    );
  }
}

class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DashboardTop(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: DashboardBody(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: DashboardTop(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: DashboardBody(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:socialtec/settings/responsive.dart';

import 'components/dashboard_body.dart';
import 'components/dashboard_top.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('Bob Cholo'),
              accountEmail: Text('bob_cholo@gmail.com'),
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: AssetImage('assets/customs/bob_cholo.png'),
              // ),
            ),
            ListTile(
              title: Text('Titulo'),
              subtitle: Text('subtitulo'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text('Titulo 2'),
              subtitle: Text('subtitulo 2'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
        ),
      ),
      body: const Responsive(
          desktop: DesktopDashboardScreen(),
          mobile: MobileDashboardScreen(),
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
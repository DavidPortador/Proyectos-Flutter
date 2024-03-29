import 'package:flutter/material.dart';
import 'package:socialtec/settings/responsive.dart';
import 'package:socialtec/components/background.dart';

import 'components/dashboard_body.dart';
import 'components/dashboard_top.dart';

 List<String?> session = List.empty();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.data});

  final List<String?> data;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    session = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.data[0]!),
              accountEmail: Text(widget.data[2]!),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(widget.data[1]!),
                radius: 40,
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              title: const Text('Sign Out'),
              subtitle: Text('${widget.data[3]} User'),
              leading: const Icon(Icons.logout),
              onTap: () {
                // XDDDDDDDDDDDDD
                Navigator.pop(context);
                Navigator.pop(context);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const DashboardTop(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: DashboardBody(data: session),
            ),
            const Spacer(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(
          child: DashboardTop(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: DashboardBody(data: session),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.brightness_6_rounded),
          onPressed: () {
            Navigator.pushNamed(context, '/theme');
          },
          label: Text(
            "Themes"
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          label: Text(
            "Logout"
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            //onPrimary: Colors.black,
          ),
        ),
      ],
    );
  }
}

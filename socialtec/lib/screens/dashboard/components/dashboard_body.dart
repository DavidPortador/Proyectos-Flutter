import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            icon: Icon(Icons.brightness_6_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/theme');
            },
            label: Text("Themes"),
          ),
          const SizedBox(height: 16),
                  ElevatedButton.icon(
            icon: Icon(Icons.post_add_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/post');
            },
            label: Text("Posts"),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
            label: Text("Logout"),
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              //onPrimary: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

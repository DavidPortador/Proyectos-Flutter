import 'package:flutter/material.dart';
import 'package:socialtec/screens/profile/profile_screen.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key, required this.data});

  final List<String?> data;

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.brightness_6_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/theme');
            },
            label: const Text("Themes"),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.post_add_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/post');
            },
            label: const Text("Posts"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.edit_calendar_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/events');
            },
            label: const Text("Events"),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.http_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/popular');
            },
            label: const Text("Movies"),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.cloud_circle_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/nasa');
            },
            label: const Text("Nasa"),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 5, 132, 149),
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.supervised_user_circle_sharp),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileScreen(
                      data: widget.data,
                    );
                  },
                ),
              );
            },
            label: const Text("Profile"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text("Sign Out"),
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

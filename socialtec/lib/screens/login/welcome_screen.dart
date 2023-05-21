import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.data, this.googleSignIn});

  final List<String> data;
  final GoogleSignIn? googleSignIn;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.data[1]),
              radius: 40,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),
            Text(widget.data[0]),
            const SizedBox(height: 20),
            Text(widget.data[2]),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                if (widget.googleSignIn != null) {
                  if (await widget.googleSignIn!.isSignedIn()) {
                    widget.googleSignIn!.signOut();
                    print('CERRADAAA');
                  }
                }
                Navigator.pop(context);
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:socialtec/auth_social/auth_google.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // FlutterLogo(size: 100),
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl!),
                radius: 40,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 20),
              Text(name!),
              SizedBox(height: 20),
              Text(email!),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  signOutGoogle();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.exit_to_app),
                label: Text('Sign Out')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

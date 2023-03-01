import 'package:flutter/material.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return LoginScreen();
              //     },
              //   ),
              // );
              Navigator.pushNamed(context, '/theme');
            },
            child: Text(
              "Login"
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return SignUpScreen();
            //     },
            //   ),
            // );
            Navigator.pushNamed(context, '/signup');
          },
          //style: ElevatedButton.styleFrom(primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "Sign Up"
          ),
        ),
      ],
    );
  }
}

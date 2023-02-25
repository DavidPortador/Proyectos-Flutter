import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final txtEmail = TextFormField(
  decoration: const InputDecoration(
      label: Text("Email User"), border: OutlineInputBorder()),
);

final txtPass = TextFormField(
  decoration: const InputDecoration(
      label: Text("Password User"), border: OutlineInputBorder()),
);

final space = SizedBox(
  height: 10,
);

final btlLogin = SocialLoginButton(
  buttonType: SocialLoginButtonType.generalLogin,
  onPressed: () {},
);

final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google, 
    onPressed: () {}
);

final btnFacebook = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook, 
    onPressed: () {}
);

final btnGithub = SocialLoginButton(
    buttonType: SocialLoginButtonType.github, 
    onPressed: () {}
);

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            txtEmail, 
            space, 
            txtPass, 
            space, 
            btlLogin, 
            space, 
            btnGoogle, 
            space, 
            btnFacebook, 
            space, 
            btnGithub
          ],
        ),
      ),
    );
  }
}

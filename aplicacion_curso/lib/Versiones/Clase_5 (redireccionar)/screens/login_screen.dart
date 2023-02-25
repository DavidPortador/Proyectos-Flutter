import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      buttonType: SocialLoginButtonType.google, onPressed: () {});

  final btnFacebook = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});

  final btnGithub = SocialLoginButton(
      buttonType: SocialLoginButtonType.github, onPressed: () {});

  final img_logo = Image.asset('assets/logo.png', height: 220);

  @override
  Widget build(BuildContext context) {

    // Metodo dependiente del contexto (Navigator)
    final txtRegister = Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          )),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.7,
                image: AssetImage('assets/fondo.jpg'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                  btnGithub,
                  space,
                  txtRegister
                ],
              ),
              Positioned(top: 50, child: img_logo),
            ],
          ),
        ),
      ),
    );
  }
}

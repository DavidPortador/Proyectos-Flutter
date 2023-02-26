import 'package:flutter/material.dart';
import 'package:app/widgets/loading_model_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = TextFormField(
    decoration: const InputDecoration(
      label: Text("Email User", 
        style: TextStyle(
          color: Color.fromRGBO(0, 255, 0, 1),
        ),
      ), 
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
          width: 2, 
          color: Color.fromRGBO(82, 180, 82, 1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 4, 
          color: Color.fromRGBO(0, 255, 0, 1),
        ),
      ), 
    ),
  );

  final txtPass = TextFormField(
    decoration: const InputDecoration(
      label: Text("Password User", 
        style: TextStyle(
          color: Color.fromRGBO(0, 255, 0, 1),
        ),
      ), 
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(
          width: 2, 
          color: Color.fromRGBO(82, 180, 82, 1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 4, 
          color: Color.fromRGBO(0, 255, 0, 1),
        ),
      ),
    ),
  );

  final space = SizedBox(
    height: 10,
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
    final txtRegister = Padding(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: TextButton(
          onPressed: () {
            // Metodo dependiente del contexto (Navigator)
            Navigator.pushNamed(context, '/register');
          },
          child: Text(
            'Crear cuenta',
            style:
              TextStyle(
                fontSize: 18, 
                decoration: TextDecoration.underline, 
                color: Color.fromRGBO(0, 255, 0, 1),
                fontWeight: FontWeight.bold
              ),
          )),
    );

    final btlLogin = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(milliseconds: 2000)).then((value) {
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context, '/dash');
        });
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.7,
                  image: AssetImage('assets/fondo.jpg')
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      // btnFacebook,
                      // space,
                      // btnGithub,
                      // space,
                      txtRegister
                    ],
                  ),
                  Positioned(top: 60, child: img_logo),
                ],
              ),
            ),
          ),
          isLoading ? LoadingModelWidget() : Container()
        ],
      ),
    );
  }
}

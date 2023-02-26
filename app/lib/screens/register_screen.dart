import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Registro',
      style: TextStyle(fontSize: 30),
    );

    // Componentes formulario
    final txtEmail = TextFormField(
      decoration: const InputDecoration(
        label: Text(
          "Email User",
          style: TextStyle(
            color: Color.fromRGBO(0, 255, 0, 1),
          ),
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
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
        label: Text(
          "Password User",
          style: TextStyle(
            color: Color.fromRGBO(0, 255, 0, 1),
          ),
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
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

    final btnRegistrar = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        print('siuuuu');
      },
      child: Text('Registrar'),
    );

    // FIN Componentes Formulario

    final space = SizedBox(
      height: 10,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      title,
                      space,
                      txtEmail,
                      space,
                      txtPass,
                      space,
                      btnRegistrar
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

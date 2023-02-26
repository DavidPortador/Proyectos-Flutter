import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // This is the file that will be used to store the image
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  final fname = TextEditingController();
  final lname = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fname.dispose();
    lname.dispose();
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEmail(String em) {
      String p =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(p);
      return regExp.hasMatch(em);
    }

    final title = Text(
      'Registro',
      style: TextStyle(fontSize: 30),
    );

    // Componentes formulario

    final txtNombre = TextFormField(
      controller: fname,
      decoration: const InputDecoration(
        label: Text(
          "Name",
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

    final txtApellidos = TextFormField(
      controller: lname,
      decoration: const InputDecoration(
        label: Text(
          "Last name",
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

    final txtEmail = TextFormField(
      controller: email,
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
      controller: pass,
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
        var fn = fname.text;
        var ln = lname.text;
        var em = email.text;
        var ps = pass.text;

        if (fn == "") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("First name empty"),
              );
            },
          );
        } else if (ln == "") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Last name empty"),
              );
            },
          );
        } else if (em == "") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Email empty"),
              );
            },
          );
        } else if (ps == "") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Password empty"),
              );
            },
          );
        } else {
          if (isEmail(em)) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Formato para registro valido"),
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("FORMATO DE EMAIL INCORRECTO"),
                );
              },
            );
          }
        }
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      title,
                      space,
                      

                      Column(children: [
                        // The picked image will be displayed here
                        Container(
                          alignment: Alignment.center,
                          width: 250,
                          height: 250,
                          color: Colors.grey[300],
                          child: _image != null
                              ? Image.file(_image!, fit: BoxFit.cover)
                              : const Text(
                                  'Please select an image',
                                  style: TextStyle(color: Colors.black),
                                ),
                        ),
                        Center(
                          // this button is used to open the image picker
                          child: ElevatedButton(
                            onPressed: _openImagePicker,
                            child: const Text('Select An Image'),
                          ),
                        ),
                        const SizedBox(height: 35),
                      ]),

                      txtNombre,
                      space,
                      txtApellidos,
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

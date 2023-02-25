import 'package:flutter/material.dart';

class LoadingModelWidget extends StatelessWidget {
  const LoadingModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(100, 100, 100, 0.5),
      child: Center(child: Image.asset('assets/loading.gif'))
    );
  }

}
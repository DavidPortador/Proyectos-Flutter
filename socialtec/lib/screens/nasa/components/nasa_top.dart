import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const double defaultPadding = 16.0;

class NasaTop extends StatelessWidget {
  const NasaTop({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Pictures Albums",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: defaultPadding / 2),
        Row(
          children: [
            Expanded(
              flex: 8,
              child: LottieBuilder.asset(
                "assets/animation/cute_2.json",
                height: 300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
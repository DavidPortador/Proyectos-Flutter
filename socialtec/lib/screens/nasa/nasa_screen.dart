import 'package:flutter/material.dart';
import 'package:socialtec/settings/responsive.dart';
import 'package:socialtec/components/background.dart';
import 'components/nasa_body.dart';
import 'components/nasa_top.dart';

class NasaScreen extends StatelessWidget {
  const NasaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API NASA'),
      ),
      body: const Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileNasaScreen(),
            desktop: DesktopNasaScreen()),
        ),
      ),
    );
  }
}

class MobileNasaScreen extends StatelessWidget {
  const MobileNasaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NasaTop(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: NasaBody(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class DesktopNasaScreen extends StatelessWidget {
  const DesktopNasaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: NasaTop(),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: NasaBody(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

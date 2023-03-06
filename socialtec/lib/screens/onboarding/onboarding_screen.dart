import 'package:socialtec/screens/onboarding/components/card_planet.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:socialtec/settings/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "WELCOME TO SOCIALTEC",
      subtitle: "The social network to share music witch your friends.",
      image: LottieBuilder.asset("assets/animation/cute_1.json"),
      backgroundColor: blueBackgroundColor,
      titleColor: darkBackgroundColor,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/music_3.json"),
    ),
    CardPlanetData(
      title: "MUSIC FOR EVERYONE",
      subtitle: "An endless number of galaxies means endless possibilities.",
      image: LottieBuilder.asset("assets/animation/music_1.json"),
      backgroundColor: purplePrimaryColor,
      titleColor: darkBackgroundColor,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/load_1.json"),
    ),
    CardPlanetData(
      title: "LET'S STARTED",
      subtitle: "Sing in or sign up to share music whith all the world.",
      image: LottieBuilder.asset("assets/animation/cute_3.json"),
      backgroundColor: purpleBackgroundColor,
      titleColor: bluePrimaryColor,
      subtitleColor: Colors.black,
      background: LottieBuilder.asset("assets/animation/bg_1.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        // Por alguna razon tenía un parámetro que no utiliza
        //itemBuilder: (int index, double value) {
        itemBuilder: (int index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}

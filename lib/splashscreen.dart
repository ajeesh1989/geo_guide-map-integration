import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      body: Center(
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: LottieBuilder.network(
                  "https://assets10.lottiefiles.com/packages/lf20_svy4ivvy.json",
                  fit: BoxFit.fill),
            ),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  duration: const Duration(seconds: 5),
                  'Explore now!',
                  textStyle:
                      const TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
      ),
    );
  }
}

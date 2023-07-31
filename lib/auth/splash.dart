import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tenementz/auth/authstream.dart';
import 'package:tenementz/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(5.seconds, () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AuthStream()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/splash.jpg'),
                      fit: BoxFit.cover)),
            ),
            const Positioned(
                left: 30,
                right: 30,
                bottom: 30,
                child: SpinKitCircle(color: kSecondary, size: 70))
          ],
        ),
      ),
    );
  }
}

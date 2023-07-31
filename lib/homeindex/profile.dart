import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import '../consts/colors.dart';
import '../consts/text.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * 0.15,
              width: size.width * 0.5,
              child: Stack(
                children: [
                  CircleAvatar(
                          radius: size.width * 0.25,
                          foregroundImage:
                              const AssetImage('assets/playstorelogo.png'))
                      .centered(),
                  Positioned(
                      right: 50,
                      bottom: 5,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(Icons.camera_alt_rounded,
                              color: kPrimary, size: 25),
                        ),
                      ))
                ],
              ),
            ).centered(),
            Drawitem(ontap: () async {}, title: 'Favorite Properties'),
            Drawitem(ontap: () {}, title: 'Notifications'),
            Drawitem(ontap: () {}, title: 'Privacy Policy'),
            const SizedBox(height: 80),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class Drawitem extends ConsumerWidget {
  const Drawitem({
    super.key,
    required this.ontap,
    required this.title,
  });

  final VoidCallback ontap;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
            tileColor: Colors.white,
            onTap: ontap,
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Labletext(text: title))
        .py8();
  }
}

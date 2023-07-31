import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenementz/consts/colors.dart';
import 'package:tenementz/consts/text.dart';
import 'package:tenementz/homeindex/profile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/buttons.dart';

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Headertext(text: 'Menu', color: kDark).centered(),
          const SizedBox(height: 40),
          Drawitem(ontap: () {}, title: 'News'),
          Drawitem(ontap: () {}, title: 'Facebook'),
          Drawitem(ontap: () {}, title: 'Twitter'),
          Drawitem(ontap: () {}, title: 'Youtube'),
          Drawitem(ontap: () {}, title: 'Instagram'),
          Drawitem(ontap: () {}, title: 'About Us'),
          Drawitem(ontap: () {}, title: 'Contact Us'),
          const SizedBox(height: 80),
          ListTile(
            tileColor: Colors.white,
            onTap: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Labletext(text: 'Log out ?').centered(),
                    content: const Bodytext(
                            text: 'Are you sure you want to log out?',
                            color: Colors.black,
                            alignment: TextAlign.center)
                        .py12(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    actions: [
                      CancelBtn(
                          function: () => Navigator.pop(context),
                          text: 'Cancel'),
                      ConfirmBtn(
                        function: () {
                          Navigator.pop(context);
                          FirebaseAuth.instance.signOut();
                        },
                        text: 'Log out',
                      )
                    ],
                  );
                }),
            leading: const Icon(Icons.logout, size: 25, color: kTertiary),
            title: const Text(
              'Logout',
              style: TextStyle(color: kTertiary, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

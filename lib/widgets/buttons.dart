import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/colors.dart';
import '../consts/text.dart';

class FiledButton extends StatelessWidget {
  const FiledButton({super.key, required this.function, required this.text});
  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          foregroundColor: MaterialStateProperty.all(kPrimary),
          backgroundColor: MaterialStateProperty.all(kPrimary)),
      child: Whitetext(text: text),
    ).py24();
  }
}

class ClassBtnO extends ConsumerWidget {
  const ClassBtnO(this.action, this.text, this.icon, {super.key});
  final VoidCallback action;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return Semantics(
      child: GestureDetector(
        onTap: action,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.8,
          height: 50,
          decoration: BoxDecoration(
            //color: kPrimary,
            border: Border.all(width: 1.5, color: kPrimary),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 30),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimary,
                    fontFamily: 'Manrope',
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ).centered(),
            ],
          ),
        ),
      ),
    ).centered();
  }
}

class ClassBtn extends ConsumerWidget {
  const ClassBtn(this.action, this.text, {super.key});
  final VoidCallback action;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return Semantics(
      child: GestureDetector(
        onTap: action,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size.width * 0.8,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Whitetext(text: text).centered(),
        ),
      ),
    ).centered();
  }
}

class CancelBtn extends StatelessWidget {
  const CancelBtn({super.key, required this.function, required this.text});
  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: function,
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 45,
          width: size.width * 0.3,
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: kNeutral),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: kNeutral,
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ).centered(),
        ),
      ),
    );
  }
}

class ConfirmBtn extends StatelessWidget {
  const ConfirmBtn({super.key, required this.function, required this.text});
  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: function,
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 45,
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: kTertiary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Manrope',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ).centered(),
        ),
      ),
    );
  }
}

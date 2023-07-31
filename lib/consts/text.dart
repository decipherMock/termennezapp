import 'package:flutter/material.dart';

import 'colors.dart';

class Headertext extends StatelessWidget {
  const Headertext({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: 'Popb', fontSize: 18, color: color),
    );
  }
}

class Labletext extends StatelessWidget {
  final String text;

  const Labletext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontFamily: 'Popb', fontSize: 15),
    );
  }
}

class Fieldlabel extends StatelessWidget {
  final String text;

  const Fieldlabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontFamily: 'Pop', fontSize: 14),
    );
  }
}

class Ltext extends StatelessWidget {
  final String text;

  const Ltext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Pop',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: kNeutral),
    );
  }
}

class Bodytext extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign alignment;

  const Bodytext(
      {super.key,
      required this.text,
      required this.color,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Pop',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: color),
    );
  }
}

class Buttontext extends StatelessWidget {
  final String text;

  const Buttontext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: kPrimary,
          fontFamily: 'Pop',
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }
}

class Whitetext extends StatelessWidget {
  final String text;

  const Whitetext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Pop',
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }
}

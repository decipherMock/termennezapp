import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenementz/consts/colors.dart';
import 'package:tenementz/consts/text.dart';
import 'package:velocity_x/velocity_x.dart';

class Highlights extends ConsumerWidget {
  const Highlights({required this.image, required this.option, super.key});
  final String image;
  final String option;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.98,
      height: size.height * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: kTertiary,
            child: Text(option).p12(),
          ),
          const Spacer(),
          // Row(
          //   children: [
          //     Column(children: [
          //       Text(''),
          //       ListTile(
          //         leading: Icon(Icons.directions),
          //         title: Text('data'),
          //         trailing: Text('data'),
          //       )
          //     ]),
          //     const Spacer(),
          //     Text('GHS $option')
          //   ],
          // )
        ],
      ),
    );
  }
}

class TopSearch extends ConsumerWidget {
  const TopSearch({required this.image, required this.loc, super.key});
  final String image;
  final String loc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
        width: size.width * 0.4,
        height: size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Center(
          child: Headertext(text: loc, color: kwhite),
        ));
  }
}

class BigHouse extends ConsumerWidget {
  const BigHouse(this.image, {super.key});
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: size.height * 0.37,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kwhite,
          boxShadow: [BoxShadow(color: kDark.withOpacity(0.5), blurRadius: 5)]),
      child: Stack(children: [
        Container(
          width: size.width,
          height: size.height * 0.23,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        Positioned(
            top: size.height * 0.2,
            right: 30,
            child: const CircleAvatar(
              backgroundColor: kBackground,
              radius: 30,
              child: Center(
                child: Icon(Icons.favorite_border_outlined, size: 30),
              ),
            )),
        Positioned(
            top: size.height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Labletext(text: 'GHS 24,900'),
                SizedBox(
                  width: size.width * 0.7,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      Bodytext(
                          text: 'Kumasi, Ahwiann',
                          color: kNeutral,
                          alignment: TextAlign.center),
                      Spacer(),
                      Bodytext(
                          text: '400m2',
                          color: kNeutral,
                          alignment: TextAlign.center)
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const HStack(alignment: MainAxisAlignment.center, [
                  Icon(Icons.bed),
                  SizedBox(width: 5),
                  Text('2 beds'),
                  SizedBox(width: 15),
                  Icon(Icons.shower),
                  SizedBox(width: 5),
                  Text('2 beds'),
                  SizedBox(width: 15),
                  Icon(Icons.car_rental),
                  SizedBox(width: 5),
                  Text('2 beds'),
                ]).px24()
              ],
            ).px12())
      ]),
    );
  }
}

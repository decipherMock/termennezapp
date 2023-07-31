import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:tenementz/consts/colors.dart';
import 'package:tenementz/consts/text.dart';
import 'package:tenementz/widgets/container.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CarouselSliderController controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: size.height * 0.43,
            width: size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * 0.4,
                  width: size.width,
                  child: Stack(children: [
                    CarouselSlider(
                      autoSliderDelay: 10.seconds,
                      controller: controller,
                      onSlideChanged: (value) {
                        setState(() {
                          _current = value;
                        });
                      },
                      children: images
                          .map((item) => Image.asset(
                                item,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => controller.nextPage(),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kSecondary.withOpacity(
                                      _current == entry.key ? 0.9 : 0.5)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  left: 20,
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: 60,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: kDark),
                      decoration: InputDecoration(
                        hintText: 'Search Property by name',
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: const Icon(
                          Icons.search_sharp,
                          size: 40,
                          color: kDark,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kDark, width: 1.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kDark, width: 1.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kDark, width: 1.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: kDark, width: 1.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: const Labletext(text: 'Highlight').py16().px20()),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...images.map((e) => Highlights(image: e, option: 'For rent'))
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        SliverToBoxAdapter(
            child: const Labletext(text: 'Top Searches').py16().px20()),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...images.map((e) => TopSearch(image: e, loc: 'For rent'))
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),
        SliverToBoxAdapter(
            child: const Labletext(text: 'Today\'s New').py16().px20()),
        SliverList.builder(
            itemCount: 4,
            itemBuilder: ((context, index) => BigHouse(images[index])))
      ],
    );
  }
}

const images = [
  "assets/images/ciudad-maderas-MXbM1NrRqtI-unsplash-min.jpg",
  "assets/images/dillon-kydd-pvdx8c6Y5BY-unsplash-min.jpg",
  "assets/images/edvin-johansson-rlwE8f8anOc-unsplash (1)-min.jpg",
  "assets/images/vojtech-bruzek-Yrxr3bsPdS0-unsplash-min.jpg"
];

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenementz/consts/colors.dart';
import 'package:tenementz/homeindex/home/home.dart';
import 'package:tenementz/homeindex/menu.dart';
import 'package:tenementz/homeindex/profile.dart';
import 'package:tenementz/homeindex/search.dart';
import 'package:tenementz/providers/navprovider.dart';

class Render extends ConsumerStatefulWidget {
  const Render({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RenderState();
}

class _RenderState extends ConsumerState<Render> {
  List<Widget>? pages;
  void onItemTapped(int index) {
    ref.watch(indexProvider.notifier).state = index;
  }

  @override
  void initState() {
    super.initState();

    pages = [const Homepage(), const Search(), const Profile(), const Menu()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: pages!,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          backgroundColor: kwhite,
          showUnselectedLabels: true,
          selectedItemColor: kTertiary,
          unselectedItemColor: kDark,
          showSelectedLabels: true,
          iconSize: 30,
          currentIndex: ref.watch(indexProvider),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'Menu',
            ),
          ]),
    ).animate().fadeIn(duration: 1.seconds);
  }
}

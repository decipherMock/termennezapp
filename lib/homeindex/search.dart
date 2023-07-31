import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenementz/consts/text.dart';

import '../consts/colors.dart';

class SearchService {
  searchByLoc(String field) {
    return FirebaseFirestore.instance
        .collection('company')
        .where('searchKey', isEqualTo: field.substring(0, 1).toUpperCase())
        .get();
  }
}

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  var queryResultSet = [];
  var tempSearchstore = [];

  startSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchstore = [];
      });
    }

    var uppercasevalue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.isEmpty && value.length == 1) {
      SearchService().searchByLoc(value).then((QuerySnapshot searchdocs) {
        for (int i = 0; i < searchdocs.docs.length; ++i) {
          queryResultSet.add(
            searchdocs.docs[i].data(),
          );
        }
      });
    } else {
      tempSearchstore = [];
      queryResultSet.forEach((element) {
        if (element["location"].startsWith(uppercasevalue)) {
          setState(() {
            tempSearchstore.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(
            width: size.width * 0.75,
            height: 60,
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(color: kDark),
              decoration: InputDecoration(
                hintText: 'Search Property...',
                fillColor: Colors.white,
                filled: true,
                suffixIcon: const Icon(
                  Icons.search_sharp,
                  size: 40,
                  color: kDark,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kwhite, width: 1.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kwhite, width: 1.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kwhite, width: 1.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kwhite, width: 1.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ...['Sale', 'Rent', 'Apartments'].map((e) => Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green)),
                    child: Center(
                      child: Bodytext(
                          text: e,
                          color: Colors.green,
                          alignment: TextAlign.center),
                    ),
                  )),
              const Spacer(),
              Container(
                width: 100,
                height: 40,
                decoration: const BoxDecoration(color: kSecondary),
                child: const Center(
                  child: Bodytext(
                      text: 'Filters',
                      color: Colors.white,
                      alignment: TextAlign.center),
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:memra/constants/common_functions.dart';

import '../../../constants/constants.dart';
import '../../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(width * 1, height * 0.08),
            child: HomePageAppBar(width: width, height: height)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenAddressBar(height: height, width: width),
              CommonFuctions.divider(),
              SizedBox(
                height: height * 0.1,
                width: width,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: width * 0.009,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage(
                              'assets/images/categories/${categories[index]}.png',
                            ),
                            height: height * 0.07,
                          ),
                          Text(
                            categories[index],
                            style: textTheme.labelMedium,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              CommonFuctions.blankSpace(height * 0.01, 0),
              CommonFuctions.divider(),
              HomeScreenCategoriesList(height: height, width: width)
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      width: width,
      child: CarouselSlider(
        options: CarouselOptions(
            height: 400, autoPlay: true, viewportFraction: 1),
        items: carouselPictures.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/carousel_slideshow/${i}'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class HomeScreenAddressBar extends StatelessWidget {
  const HomeScreenAddressBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.012),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.81,
            child: TextField(
              onTap: () {
                //log();
              },
              cursorColor: indigo,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                hintText: "Search our vault..",
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: indigo,
                    )),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_sharp,
                    color: indigo,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: grey,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: grey,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: grey,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: black,
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GoogleAdsPreviewSlider extends StatelessWidget {
  const GoogleAdsPreviewSlider({super.key, required this.adImageUrls});

  final List<String> adImageUrls;


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Adjust the height of the slider as needed
        autoPlay: true, // Set to true for automatic image sliding
        enlargeCenterPage: true, // Set to true for a larger image in the center
        enableInfiniteScroll: true, // Set to true to enable infinite scrolling
        autoPlayInterval: const Duration(seconds: 3), // Duration between slides
        autoPlayAnimationDuration: const Duration(milliseconds: 800), // Animation duration
        autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
        onPageChanged: (index, reason) {
          // Callback function when the page changes
          // You can use this to update any indicators or do other actions
        },
      ),
      items: adImageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

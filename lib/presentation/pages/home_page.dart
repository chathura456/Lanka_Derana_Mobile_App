import 'package:flutter/material.dart';
import 'package:lanka_derana/data/loaded_data/data.dart';
import 'package:lanka_derana/presentation/pages/location_selection_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/homePage/ad_post_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSliderVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = deviceWidth <= 600;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationSelectionPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.location_on),
                label: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '|',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.category),
                label: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: isSmallScreen ? 65 : 85,
              child: TextButton.icon(
                onPressed: () {
                  //...
                },
                icon: const Icon(Icons.filter_alt_outlined),
                label: const Text(''),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        // ImageSlider(),
        // const SizedBox(height: 25),
        AdPostView(
          adPostsList: loadedAdPostList,
        ),
      ],
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});
 
  @override
  State<StatefulWidget> createState() {
    return _ImageSliderState();
  }
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;

  List<String> imageList = [
    'assets/images/items/Nissan FB14.jpg',
    'assets/images/items/Toyota axio car.jpg',
    'assets/images/items/JBL PARTY BOX.jpg',
    'assets/images/items/RENT A CAR L 200 CAB.jpg',
    // Add more image URLs or assets
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      items: imageList.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({super.key});

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  int _current = 0;
  List<String> images = [
    'assets/images/img.jpg',
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
  ];
  List<String> places = [
    'PAKISTAN',
    'KASHMIR',
    'PUNJAB',
    'LAHORE',
    'ISLAMABAD',
    'KARACHI',
    'FAISALABAD',
  ];

  List<Widget> generateIMages() {
    return images
        .map((e) => ClipRRect(
            child: Image.asset(
              e,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Carousel'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Stack(
          children: [
            CarouselSlider(
                items: generateIMages(),
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    // aspectRatio: 14 / 8,
                    onPageChanged: (index, value) {
                      setState(() {
                        _current = index;
                      });
                    })),
            AspectRatio(
              aspectRatio: 14 / 8,
              child: Center(
                child: Text(
                  places[_current],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({super.key});

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  final myitems = [
    Image.asset('assets/img01.jpg'),
    Image.asset('assets/img02.jpg'),
    Image.asset('assets/img03.jpg'),
    Image.asset('assets/img04.jpg'),
    Image.asset('assets/img05.jpeg'),
    Image.asset('assets/img06.jpg'),
  ];

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffd9d9d9),
        appBar: AppBar(
          title: const Text(
            'Ferrari Castaneda',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 3,
          backgroundColor: const Color(0xff700b0b),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 400,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                ),
                items: myitems,
              ),
              AnimatedSmoothIndicator(
                activeIndex: myCurrentIndex,
                count: myitems.length,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 10,
                  dotColor: const Color(0xff4d4d4d),
                  activeDotColor: const Color(0xff520202),
                  paintStyle: PaintingStyle.fill,
                ),
              )
            ],
          ),
        ));
  }
}

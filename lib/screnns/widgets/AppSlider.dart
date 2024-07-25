import 'package:carousel_slider/carousel_slider.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flex/constant/dimens.dart';

import 'package:flutter/material.dart';


class AppSlider extends StatefulWidget {
  const AppSlider({super.key, required this.imgList});

  final List<String> imgList;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselController _controller = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
              carouselController: _controller,
              items: widget.imgList
                  .map((e) => Padding(
                        padding: EdgeInsets.all(AppDimens.medium),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppDimens.medium),
                                child: Image.asset(e,
                                fit: BoxFit.cover,),
                                //TODO  we have to change this t image snetwork 
                            // child: Image.network(
                            //   e.image,
                            //   fit: BoxFit.cover,
                            // )
                            ),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: .8,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
          Positioned(
              bottom: 30,
              right: 40, 
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imgList
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => _controller.animateToPage(e.key),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == e.key
                                      ? MyColors.primaryColor
                                      : Colors.grey),
                            ),
                          ),
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }
}

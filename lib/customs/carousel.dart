import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallify/customs/pageIndicator.dart';
import 'package:wallify/utils/constants.dart';
import 'package:wallify/utils/extensions.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentPage = 0;
  UtilClass _utilClass = UtilClass();

  List<String> images = [
    "https://assets.hardwarezone.com/img/2020/06/memoji-face-mask.jpg",
    "https://assets.hardwarezone.com/img/2020/06/memoji-face-mask.jpg",
    "https://assets.hardwarezone.com/img/2020/06/memoji-face-mask.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    PageController pageController = PageController(initialPage: 0);

    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height / 2.3,
          child: new PageView.builder(
            onPageChanged: (val) {
              setState(() {
                _currentPage = val;
              });
            },
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  new GestureDetector(
                    onTap: () {
                      // => Navigator.push(context,
                      //   FadeRoute(page: ViewImage(widget.propImages[index])))
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: CachedNetworkImage(
                            imageUrl: images[index],
                            fit: BoxFit.contain,
                            placeholder: (context, url) =>
                                Image.asset("placeholder".png),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Get started with wallify epic user experience\nand accessible user interface',
                    style: TextStyle(
                        color: _utilClass.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
            itemCount: images.length,
            // loop: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 58.0, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(i == _currentPage ? PageIndicator(true) : PageIndicator(false));
    }
    return list.toList();
  }
}

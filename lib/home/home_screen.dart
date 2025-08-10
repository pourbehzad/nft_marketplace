import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_marketplace/getStarted/widget/glassmorphism_widget.dart';

final List<String> coverImages = [
  'assets/images/spotify.jpg',
  'assets/images/art.jpg',
  'assets/images/virtual.jpg',
];
final List<String> coverNames = ['Music', 'Art', 'Virtual'];
//--------------

final List<String> collectionImages = [
  'assets/images/collection1.jpg',
  'assets/images/collection2.jpg',
  'assets/images/collection3.jpg',
];
final List<String> collectionNames = ['3D Art', 'Abstract Art', 'Portrait Art'];
//--------------

final List<String> sellerImages = [
  'assets/images/seller1.jpg',
  'assets/images/seller2.jpg',
  'assets/images/seller3.jpg',
];
final List<String> sellerNames = ['Wave', 'Abstract Pink', 'Blue Wave'];
//--------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'NFT Marketplace',
              style: TextStyle(
                fontFamily: 'SFPro Display',
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(coverImages.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 4,
                        left: 4,
                        top: 20,
                      ),
                      child: GlassmorphismWidget(
                        width: 252,
                        height: 168,
                        colorOpacity: 0.0,
                        borderOpacity: 0.9,
                        borderWidth: 0.9,
                        blur: 54,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(28),
                              child: Image.asset(
                                coverImages[index],
                                fit: BoxFit.cover,
                                width: 252,
                                height: 168,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(28),
                                  bottomRight: Radius.circular(28),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 8,
                                    sigmaY: 8,
                                  ),
                                  child: Container(
                                    height: 54,
                                    alignment: Alignment.center,
                                    child: Text(coverNames[index]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              ScrollableRow(
                title: 'Trending collections',
                imageList: collectionImages,
                nameList: collectionNames,
              ),
              ScrollableRow(
                imageList: sellerImages,
                nameList: sellerNames,
                title: 'Top seller',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollableRow extends StatelessWidget {
  final String title;
  final List<String> imageList;
  final List<String> nameList;

  const ScrollableRow({
    super.key,
    required this.imageList,
    required this.nameList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 27, bottom: 7, left: 14),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'SFPro Display',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: List.generate(imageList.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.5),
                child: GlassmorphismWidget(
                  width: 168,
                  height: 198,
                  colorOpacity: 0.2,
                  borderOpacity: 0.5,
                  borderWidth: 0.9,
                  blur: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imageList[index],
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: SizedBox(
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nameList[index],
                                  style: TextStyle(
                                    fontFamily: 'SFPro Display',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      ' 200',
                                      style: TextStyle(
                                        fontFamily: 'SFPro Display',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

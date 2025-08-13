import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_marketplace/bottomNav/bottom_nav.dart';
import 'package:nft_marketplace/getStarted/widget/glassmorphism_widget.dart';
import 'package:nft_marketplace/home/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/firstScreen.png',
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 80),
            child: Column(
              children: [
                Text(
                  'Welcome to NFT Marketplace',
                  style: TextStyle(
                    fontFamily: 'SFPro Display',
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),
                GlassmorphismWidget(
                  width: double.infinity,
                  height: 300,
                  colorOpacity: 0.01,
                  borderOpacity: 0.2,
                  blur: 20.0,
                  borderWidth: 0.7,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 27, bottom: 5),
                          child: Text(
                            'Explore and Mint NFTs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'You can buy and sell the NFTs of the best artists in the world.',
                            style: TextStyle(
                              color: Color(0xFFEBEBF5).withValues(alpha: 0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 54,
                            vertical: 27,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Material(
                              color: Colors.transparent,
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 70,
                                  sigmaY: 70,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BottomNav(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.3,
                                        ),
                                        width: 1.1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Get started now',
                                        style: TextStyle(
                                          fontFamily: 'SFPro Display',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_marketplace/getStarted/widget/glassmorphism_widget.dart';

class RankingScreen extends StatelessWidget {
  RankingScreen({super.key});

  final List<String> titles = [
    'Azumi',
    'Hape prime',
    'Cryoto',
    'Ape Club',
    'Bat',
    'Mutant',
    'Metaverse',
    'Mountain',
    'Mutant Ape',
    'The Sandbox',
  ];

  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/5.jpg',
  ];

  final List<String> volumes = [
    '200055.02',
    '180055.45',
    '90055.62',
    '88055.12',
    '10055.06',
    '9095.27',
    '10055.02',
    '8055.73',
    '5055.73',
    '1055.02',
  ];

  final List<String> persents = [
    '3,99%',
    '33,79%',
    '-6,65%',
    '3,99%',
    '3,99%',
    '4,12%',
    '3,99%',
    '1,89%',
    '-6,65%',
    '3,99%',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlassmorphismWidget(
                  width: 248,
                  height: 40,
                  colorOpacity: 0.1,
                  borderOpacity: 0.1,
                  borderWidth: 1,
                  blur: 54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/categories.svg',
                      height: 18,
                    ),
                  ),
                ),
                GlassmorphismWidget(
                  width: 248,
                  height: 40,
                  colorOpacity: 0.1,
                  borderOpacity: 0.1,
                  borderWidth: 1,
                  blur: 54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 10,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/chains.svg',
                      height: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Colors.blue.withValues(alpha: 0.4), Colors.transparent],
                        stops: [0.6, 0.0]
                      ),
                    ),
                  ),
                ),
                GlassmorphismWidget(
                  width: double.infinity,
                  height: double.infinity,
                  colorOpacity: 0.1,
                  borderOpacity: 0.1,
                  borderWidth: 1.4,
                  blur: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                          width: 58,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontFamily: 'SFPro Display',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(
                                    0xFFEBEBF5,
                                  ).withValues(alpha: 0.6),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          titles[index],
                          style: TextStyle(
                            fontFamily: 'SFPro Display',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'view info',
                          style: TextStyle(
                            fontFamily: 'SFPro Display',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFFEBEBF5).withValues(alpha: 0.6),
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_ethereum.svg',
                                ),
                                SizedBox(width: 5),
                                Text(
                                  volumes[index],
                                  style: TextStyle(
                                    fontFamily: 'SFPro Display',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7),
                            Text(
                              persents[index],
                              style: TextStyle(
                                fontFamily: 'SFPro Display',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: persents[index] == '-6,65%'
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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

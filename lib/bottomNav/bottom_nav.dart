import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_marketplace/add/add_screen.dart';
import 'package:nft_marketplace/home/home_screen.dart';
import 'package:nft_marketplace/profile/profile_screen.dart';
import 'package:nft_marketplace/search/search_screen.dart';
import 'package:nft_marketplace/stats/stats_screen.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    StatsScreen(),
    AddScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentPage],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          // blendMode: BlendMode.lighten,
          filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
          child: Container(
            padding: EdgeInsets.only(
              top: 14,
              left: 20,
              right: 20,
              bottom: 38,
            ),
            decoration: BoxDecoration(
              // color: Colors.black.withValues(alpha: 0.1),
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.5),
                  blurRadius: 1,
                  //  Color(0xFF292782)
                  offset: Offset(0, -79),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.bar_chart, 1),
                SizedBox(width: 40), // جا برای دکمه وسط
                _buildNavItem(Icons.search, 3),
                _buildNavItem(Icons.person, 4),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            _onItemTapped(2);
          },
          backgroundColor: Color(0xFF4C2D7F),
          shape: PolygonBorder(sides: 6, borderRadius: 9),
          child: Icon(Icons.add, size: 32, color: Colors.white),
        ),
      ),
      // Container(
      //   height: 70,
      //   width: 70,
      //   decoration: BoxDecoration(
      //     color: Color(0xFF4C2D7F),
      //     shape: BoxShape.circle,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black26,
      //         blurRadius: 10,
      //         offset: Offset(0, 4),
      //       ),
      //     ],
      //   ),
      //   child: IconButton(
      //     icon: Icon(Icons.add, size: 32, color: Colors.white),
      //     onPressed: () {
      //       _onItemTapped(2);
      //     },
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _currentPage == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? Colors.white : Colors.white54,
      ),
    );
  }
}

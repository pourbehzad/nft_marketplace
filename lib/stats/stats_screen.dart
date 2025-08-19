import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_marketplace/stats/widgets/ranking_screen.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // برای آپدیت UI هنگام تغییر تب
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor = Color(0xFF97A9F6);
    Color inactiveColor = Colors.grey;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stats',
          style: TextStyle(
            fontFamily: 'SFPro Display',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset('assets/icons/ic_more.svg'),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: activeColor),
              insets: EdgeInsets.symmetric(horizontal: 40),
            ),
            tabs: [
              _buildTab(0, Icons.bar_chart, "Ranking", activeColor, inactiveColor),
              _buildTab(1, Icons.show_chart, "Activity", activeColor, inactiveColor),
            ],
          ),
        ),
        // TabBar(
        //   controller: _tabController,
        //   indicator: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //     color: Color(0xFF97A9F6),
        //   ),
        //   tabs: [
        //     Tab(icon: Icon(Icons.bar_chart), text: 'Ranking'),
        //     Tab(icon: Icon(Icons.show_chart), text: "Activity"),
        //   ],
        // ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RankingScreen(),
          // Center(
          //   child: Text('Ranking Page', style: TextStyle(color: Colors.white)),
          // ),
          Center(
            child: Text('Activity Page', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    int index,
    IconData icon,
    String text,
    Color activeColor,
    Color inactiveColor,
  ) {
    bool isActive = _tabController.index == index;
    return 
    Stack(
      alignment: Alignment.center,
      children: [
        if (isActive)
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: RadialGradient(
                colors: [
                  activeColor.withValues(alpha: 0.5),
                  Colors.transparent,
                ],
                radius: 1.1,
                center: Alignment(0, 1),
              ),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? activeColor : inactiveColor, size: 18),
            SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                color: isActive ? activeColor : inactiveColor,
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
            ),
          ],
        ),
      ],
    );
    // AnimatedBuilder(
    //   animation: _tabController,
    //   builder: (context, _) {
    //     bool isActive = _tabController.index == index;
    //     return Container(
    //       width: 90,
    //       // height: 30,
    //       // padding: EdgeInsets.symmetric(horizontal: 4),
    //       decoration: isActive
    //           ? BoxDecoration(
    //               gradient: LinearGradient(
    //                 colors: [
    //                   activeColor.withValues(alpha: 0.3),
    //                   Colors.transparent,
    //                 ],
    //                 begin: Alignment.bottomCenter,
    //                 end: Alignment.topCenter,
    //                 stops: [0.0, 0.5]
    //               ),
    //               borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    //             )
    //           : null,
    //       child: Padding(
    //         padding: const EdgeInsets.only(bottom: 12),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(icon, color: isActive ? activeColor : inactiveColor, size: 18),
    //             SizedBox(width: 6),
    //             Text(
    //               text,
    //               style: TextStyle(
    //                 color: isActive ? activeColor : inactiveColor,
    //                 fontFamily: 'SFPro Display',
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: 18
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}

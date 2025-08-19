import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage>
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
    Color activeColor = Colors.purpleAccent;
    Color inactiveColor = Colors.grey;

    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text("Stats"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: activeColor),
              insets: EdgeInsets.symmetric(horizontal: 30),
            ),
            tabs: [
              _buildTab(0, Icons.bar_chart, "Ranking", activeColor, inactiveColor),
              _buildTab(1, Icons.show_chart, "Activity", activeColor, inactiveColor),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Ranking Page", style: TextStyle(color: Colors.white))),
          Center(child: Text("Activity Page", style: TextStyle(color: Colors.white))),
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
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isActive)
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: RadialGradient(
                colors: [
                  activeColor.withOpacity(0.4),
                  Colors.transparent,
                ],
                radius: 0.85,
                center: Alignment(0, 0),
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
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

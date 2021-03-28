import 'package:flutter/material.dart';
import 'package:pet_story/widget/home/home_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mail_outline),
      label: "消息",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "发现",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.perm_identity),
      label: "我",
    ),
  ];

  final List tabBodies = [
    Text('首页'),
    Text('消息'),
    Text('发现'),
    Text('我的'),
  ];

  void _onTapHander(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: '拍照',
          icon: ImageIcon(
            AssetImage('images/home/taking_pictures.png'),
          ),
          onPressed: () {
            print('点击拍照');
          },
        ),
        title: Text(
          "Pet Story",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: '添加好友',
            icon: ImageIcon(
              AssetImage('images/home/add_friend.png'),
            ),
            onPressed: () {
              print('点击添加新朋友');
            },
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(bottomTabs, _onTapHander),
      body: Center(
        child: tabBodies[currentIndex],
      ),
    );
  }
}

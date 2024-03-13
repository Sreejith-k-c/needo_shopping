import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:needo_shopping/views/account/account.dart';
import 'package:needo_shopping/views/homescreen/homepage.dart';
import 'package:needo_shopping/views/notification/notification.dart';
import 'package:needo_shopping/views/seach/search.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pages = [
    NeedoHome(),
    NotificationPage(),
    SearchPage(),
    UserAccount(),
  ];


  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 44, 108, 49),
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.home, color: Colors.white,size: 30,),
          Icon(Icons.notifications, color: Colors.white,size: 30,),
          Icon(Icons.search, color: Colors.white,size: 30,),
          Icon(Icons.account_circle_rounded, color: Colors.white,size: 30,),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}

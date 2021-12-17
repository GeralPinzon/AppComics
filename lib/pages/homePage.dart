import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import '../constans.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 25,
              spreadRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: tertiary,
          elevation: 10,
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/characters.png")),
              title: Text(
                "Comics",
                style: TextStyle(
                  color: terc,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/characters.png")),
              title: Text(
                "Favourite",
                style: TextStyle(
                  color: terc,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
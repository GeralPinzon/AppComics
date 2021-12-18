import 'package:appcomics/constans.dart';
import 'package:flutter/material.dart';


Container miCont (onTapTapped,indexTap,context){
  return Container(
    decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
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
              icon: ImageIcon(AssetImage("assets/icon/characters.png"),
              color: terc,),
              title: Text(
                "Comics",
                style: TextStyle(
                  color: secondary,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icon/btn-favourites-default.png"),color: terc,
              ),
              title: Text(
                "Favourite",
                style: TextStyle(
                  color: secondary,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
            ),
          ],
        ),
  );
}
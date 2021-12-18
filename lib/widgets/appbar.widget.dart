import 'package:flutter/material.dart';

import '../constans.dart';

class AppBarCustom extends StatelessWidget implements PreferredSize{

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: tertiary,
      elevation: 0,
      title: Container(

        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RaisedButton(color: Colors.black12,
                    textColor: terc,
                    child: Text(
                      "Volver",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
              onPressed: () {
                Navigator.pop(context);
              }, 
            ),
            Text(
              'ComicsApp',
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: MediaQuery.of(context).textScaleFactor * 45,
                color: terc,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        )
      ),
    );
  }
}
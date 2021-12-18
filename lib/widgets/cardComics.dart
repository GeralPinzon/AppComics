import 'package:appcomics/constans.dart';
import 'package:appcomics/models/comics.dart';
import 'package:flutter/material.dart';

Card miCardComic(Comics comic,context) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(comic.name),
          subtitle: Text("\n"+comic.description),
          leading: Image.network(comic.url),
        ),
        Row(
          
          children: <Widget>[
            TextButton.icon(
              icon: ImageIcon(AssetImage("assets/icon/btn-favourites-default.png"), color: Colors.black54,), // Your icon here
              label: Text("ADD YOUR FAVOURITES"), 
              // Your text here
              onPressed: (){},
              style: TextButton.styleFrom(primary: Colors.black54,backgroundColor: Colors.black12)
            ),
            TextButton.icon(
              icon: Icon(Icons.add_shopping_cart, color: Colors.red,), // Your icon here
              label: Text("BUY FOR: "+comic.precio.toString()) , // Your text here
              onPressed: (){},
              style: TextButton.styleFrom(primary: Colors.red,padding: EdgeInsets.only(top: 8, bottom: 9, right: 5, left: 53),
              backgroundColor: Colors.red[900], 
              //ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
              
            ),
            )
          ],
        )
      ],
    ),
  );
}
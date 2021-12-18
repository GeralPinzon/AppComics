import 'dart:convert';
import 'package:appcomics/models/comics.dart';
import 'package:appcomics/widgets/ButtomNav.dart';
import 'package:appcomics/widgets/cardComics.dart';
import 'package:http/http.dart' as http;
import 'package:appcomics/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

Future<List<Comics>>? _listComics;

class specificComics extends StatefulWidget {
  const specificComics({this.id = ""});
  final String id;

  @override
  State<specificComics> createState() => _specificComicsState();
}

class _specificComicsState extends State<specificComics> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }
  Future<List<Comics>> _getComics() async{
    final response = await http.get(Uri.parse("https://gateway.marvel.com:443/v1/public/characters/"+widget.id+"/comics?ts=1&apikey=832099c8290566dfea84ccb85622872e&hash=f4d59094fa39b3839c142b31bd9d4dd0"));
    List<Comics> comics = [];
    
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      //print(jsonData["data"]["results"]);
      
      for(var item in jsonData["data"]["results"]){
        String? itemprice;

        for(var price in item["prices"]){
          if (price["type"] == "digitalPurchasePrice"){
            itemprice=price["price"].toString();
          }
        }
        
        comics.add(Comics(item["title"], item["description"].toString()=="" ||  item["description"].toString()== "null" ? "No description available":item["description"].toString(), itemprice??"0.00", item["thumbnail"]["path"])); 
      }
      
      return comics;
    }else{
      throw Exception("Fallo la conexion");
    }
  }
  void initState() { 
    super.initState();
    _listComics=_getComics();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: 
        AppBarCustom(),
        body: FutureBuilder(
        future: _listComics,
        builder: (context,snapshop){
          if(snapshop.hasData){
            return ListView(
              children:_listComicsAll(snapshop.data),
            );
          }else if(snapshop.hasError){
            return Text("error");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
      bottomNavigationBar: miCont(onTapTapped,indexTap,context )
    );
  }
  List<Widget> _listComicsAll(datas){
    List<Widget> comics = [];
    for (var comic in datas){
      comics.add(
        miCardComic(comic,context)
      );
    }
    return comics;
  }
}
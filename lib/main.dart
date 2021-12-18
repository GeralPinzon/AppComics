import 'dart:convert';
import 'package:appcomics/models/Personajes.dart';
import 'package:appcomics/pages/specificComics.dart';
import 'package:appcomics/widgets/ButtomNav.dart';
import 'package:appcomics/widgets/appbar.widget.dart';
import 'package:appcomics/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Personajes>>? _listPersonajes;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Future<List<Personajes>> _getPersonajes() async{
    final response = await http.get(Uri.parse("https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=832099c8290566dfea84ccb85622872e&hash=f4d59094fa39b3839c142b31bd9d4dd0"));
    List<Personajes> person = [];
    
    if(response.statusCode == 200){
      
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      
      for(var item in jsonData["data"]["results"]){
        String description = item["description"] == "" ? "No description available" : item["description"];
        
        person.add(Personajes(item["id"],item["name"], item["thumbnail"]["path"],description, item["comics"]["available"]));        
      }
      
      return person;
    }else{
      throw Exception("Fallo la conexion");
    }
    
  }

  @override
  void initState() { 
    super.initState();
    _listPersonajes=_getPersonajes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ComicsApp'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [MyApp(),specificComics()];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: 
        AppBarCustom(),
      body: FutureBuilder(
        future: _listPersonajes,
        builder: (context,snapshop){
          if(snapshop.hasData){
            return ListView(
              children:_listaPersonajes(snapshop.data),
            );
          }else if(snapshop.hasError){
            return Text("error");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ), 
      bottomNavigationBar: miCont(onTapTapped, indexTap, context)
    );
  }
  List<Widget> _listaPersonajes(datas){
    List<Widget> personajes = [];
    for (var personaje in datas){
      personajes.add(
        miCard(personaje,context)
      );
    }
    return personajes;
  }
  
}


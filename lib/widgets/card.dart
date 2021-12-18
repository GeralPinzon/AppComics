import 'package:appcomics/models/Personajes.dart';
import 'package:appcomics/pages/specificComics.dart';
import 'package:flutter/material.dart';

Card miCard(Personajes person,context) {
  final String idPerson = person.id;
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(15),
    elevation: 10,
    child: Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
          title: Text(person.name),
          subtitle: Text("\nDescription: "+person.descripcion+" \n\nComics Participated: "+ person.comics.toString()),
          leading: Image.network(person.url),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () => {Navigator.push(context,
              MaterialPageRoute(builder: (context) => specificComics(id: idPerson)),
            )}, child: Text('Show comics')),
           
          ],
        )
      ],
    ),
  );
}
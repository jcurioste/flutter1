import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'basic.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: inicio(),
    );
  }
}

class inicio extends StatefulWidget {
  inicio({Key? key}) : super(key: key);

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  TextEditingController titleController = TextEditingController();
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "aplication/json"});
    List map= json.decode(response.body);
    var basic=Basic.fromJson(map[1]);
    
    
    
     print(basic.title);
     titleController.text ='título' + basic.title.toString();
    
    return 'okey';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jaime App'),
      ),
      body: ListView(children: <Widget>[
        Text("Programa manual"),
       Image.network('https://www.soyfutbol.com/__export/1553105857955/sites/debate/img/2019/03/20/messi_1.jpg_423682103.jpg'),
       Image.network('https://img.planetafobal.com/2021/12/adidas-final-22-pelota-oficial-champions-league-2022-za.jpg'),
       Image.network('https://imagenes.elpais.com/resizer/ZDBbevniCA5LT-TvUOLCWgzAZ9E=/1960x1103/cloudfront-eu-central-1.images.arcpublishing.com/prisa/HE3SMC3L7Z7XENXLHLLKE3CDEA.jpg'),
        TextFormField(
          controller: titleController,
          readOnly: true,
          decoration: InputDecoration(hintText: "title",
          border: InputBorder.none),
        ),
        ElevatedButton(
            onPressed: getData, child: new Text('Llamando a servicio web'))
      ]),
    );
  }
}

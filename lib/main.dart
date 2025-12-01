import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.teal,
          secondary: Colors.purple,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("başlık"),
          backgroundColor: Colors.amber,
        ),
        body: Text("Merhaba Dünya", style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  //bu bir call back fonksiyondur
            debugPrint("Butona tıklandı");
          },
          child: Icon(Icons.account_circle_rounded, color: Colors.blue[100]),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}

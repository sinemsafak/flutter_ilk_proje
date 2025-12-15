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
          title: Text("Başlık"),
        ),
      body: Center(
        widthFactor: 2,
        heightFactor: 2,
        child:Container(
          width: 100,
          height: 100,
          color:Colors.red,
          child:Text("sinem"),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  
            debugPrint("Tıklandı");
          },
          child: Icon(
            Icons.account_circle_rounded, 
            color: Colors.blue,
            ),
        ),
      ),
    );
  }
}

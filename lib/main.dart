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
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child:Container(
            alignment: Alignment.center,
            color: Colors.blue,
            margin: EdgeInsets.all(40),
            width: 50,
            height: 50,
            child:Text("sinem"),
          ),
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

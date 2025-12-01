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
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text("Başlık"),
        ),
      body: Container(
        color: Colors.purple,
        child: Text('sinem'*2, textAlign: TextAlign.center,
        ),
        constraints: BoxConstraints(
           minWidth: 100,
          minHeight: 100,
          maxWidth: 200,
          maxHeight: 200,
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

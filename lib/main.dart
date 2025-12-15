import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _img1 =
      "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Başlık")),
        body: Center(
          child: Container(
            width: 250,
            height: 250,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(width: 4, color: Colors.purple),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topRight: Radius.circular(30),
              ),
              image: DecorationImage(
                image: NetworkImage(_img1),
                fit: BoxFit.scaleDown,
                repeat: ImageRepeat.repeat,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 20,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  )
                ]
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "sinem",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

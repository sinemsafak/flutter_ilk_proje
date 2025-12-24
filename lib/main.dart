import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Dersleri"),
          backgroundColor: Colors.teal,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ),

        body: Row(
          children: [
            /// SOL DİKEY ALAN (D E R S L E R İ)
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                buildBox("D"),
                buildBox("E"),
                buildBox("R"),
                buildBox("S"),
                buildBox("L"),
                buildBox("E"),
                buildBox("R"),
                buildBox("İ"),
              ],
            ),

            /// SAĞ ANA ALAN
            Expanded(
              child: Column(
                children: [
                  /// ÜST YATAY ROW (D A R T)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildBox("A"),
                      buildBox("R"),
                      buildBox("T"),
                    ],
                  ),

                  /// ORTA BOŞ ALAN
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// KUTU WIDGET'I
  static Widget buildBox(String text) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      color: Colors.orange,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

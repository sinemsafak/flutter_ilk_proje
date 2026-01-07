import 'package:flutter/material.dart';

class BottomBarListBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomBar ve ListBody')),
      body: ListView(
        children: List.generate(10, (index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text('Eleman $index'),
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ayarlar'),
        ],
      ),
    );
  }
}

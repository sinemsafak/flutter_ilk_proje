import 'package:flutter/material.dart';

class ListViewGenerateMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Temel Kullanımı')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Liste Elemanı $index'),
          );
        },
      ),
    );
  }
}

class ListViewGeneratePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List.generate Kullanımı')),
      body: ListView(
        children: List.generate(10, (index) {
          return ListTile(
            title: Text('Liste Elemanı $index'),
          );
        }),
      ),
    );
  }
}

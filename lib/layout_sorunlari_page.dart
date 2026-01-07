import 'package:flutter/material.dart';

class LayoutSorunlariPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout Sorunları ve Çözümleri')),
      body: ListView(
        padding: EdgeInsets.all(10), // Padding ekleyerek sorun çözülür
        children: List.generate(10, (index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8), // Aralarındaki boşluğu ayarlayın
            child: ListTile(
              title: Text('Eleman $index'),
            ),
          );
        }),
      ),
    );
  }
}

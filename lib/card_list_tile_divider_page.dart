import 'package:flutter/material.dart';

class CardListTileDividerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card, ListTile ve Divider')),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              subtitle: Text('Ana sayfaya git'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Ana Sayfa Tıklandı");
              },
            ),
          ),
          Divider(),
          Card(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              subtitle: Text('Ayarlar sayfasına git'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Ayarlar Tıklandı");
              },
            ),
          ),
        ],
      ),
    );
  }
}

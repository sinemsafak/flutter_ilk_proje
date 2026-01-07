import 'package:flutter/material.dart';
import 'card_list_tile_divider_page.dart';
import 'listview_generate_map_page.dart';
import 'listview_builder_separator_page.dart';
import 'easyloading_toast_page.dart';
import 'alert_dialog_page.dart';
import 'bottom_bar_list_body_page.dart';
import 'layout_sorunlari_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Örnekler')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Card, ListTile ve Divider Kullanımı'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardListTileDividerPage()),
              );
            },
          ),
          ListTile(
            title: Text('ListView Temel Kullanımı ve List.generate'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListViewGeneratePage()),
              );
            },
          ),
          ListTile(
            title: Text('Bellek Dostu Liste ve SeparatorBuilder'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListViewBuilderSeparatorPage()),
              );
            },
          ),
          ListTile(
            title: Text('Liste Tıklanma ve EasyLoading'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EasyLoadingToastPage()),
              );
            },
          ),
          ListTile(
            title: Text('AlertDialog Kullanımı'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlertDialogPage()),
              );
            },
          ),
          ListTile(
            title: Text('BottomBar ve ListBody Kullanımı'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomBarListBodyPage()),
              );
            },
          ),
          ListTile(
            title: Text('Layout Sorunları ve Çözümleri'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayoutSorunlariPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

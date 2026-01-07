import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingToastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste Tıklanma Olayları')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Eleman $index'),
            onTap: () {
              EasyLoading.showToast('Eleman $index tıklandı!');
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
  configLoading(); // EasyLoading yapılandırması
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = Colors.blue;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),  // EasyLoading'i buraya ekliyoruz
      home: EasyLoadingToastPage(),
    );
  }
}

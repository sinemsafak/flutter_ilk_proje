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

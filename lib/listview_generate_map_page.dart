import 'package:flutter/material.dart';

class ListViewGenerateMapPage extends StatelessWidget {
  const ListViewGenerateMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Örnek data
    final List<Map<String, dynamic>> items = List.generate(
      10,
      (index) => {
        "id": index + 1,
        "title": "Başlık ${index + 1}",
        "subtitle": "Açıklama ${index + 1}",
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView • generate • map"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: items.map((item) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(item["id"].toString()),
              ),
              title: Text(item["title"]),
              subtitle: Text(item["subtitle"]),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${item["title"]} tıklandı"),
                  ),
                );
              },
            ),
          );
        }).toList(), // 👈 map mutlaka toList()
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CardListTilePage extends StatelessWidget {
  const CardListTilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card • ListTile • Divider"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          height: 24,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text("Başlık ${index + 1}"),
              subtitle: const Text("Bu bir Card + ListTile örneğidir"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Card ${index + 1} tıklandı"),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

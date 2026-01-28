import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView.separated"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 15,
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          height: 24,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text("Liste Elemanı ${index + 1}"),
            subtitle: const Text("ListView.separated kullanımı"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Eleman ${index + 1} tıklandı"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

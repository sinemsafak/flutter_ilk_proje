import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Switch Kullanımı")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Switch(
            value: isOpen,
            onChanged: (value) {
              setState(() => isOpen = value);
            },
          ),

          SwitchListTile(
            title: const Text("Bildirimleri Aç"),
            value: isOpen,
            onChanged: (value) {
              setState(() => isOpen = value);
            },
          ),

          Text(
            isOpen ? "Açık" : "Kapalı",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {

  String gender = "Erkek";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio Kullanımı")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RadioListTile(
            title: const Text("Erkek"),
            value: "Erkek",
            groupValue: gender,
            onChanged: (value) {
              setState(() => gender = value.toString());
            },
          ),

          RadioListTile(
            title: const Text("Kadın"),
            value: "Kadın",
            groupValue: gender,
            onChanged: (value) {
              setState(() => gender = value.toString());
            },
          ),

          Text(
            "Seçilen: $gender",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

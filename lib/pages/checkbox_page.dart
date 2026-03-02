import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {

  bool isChecked = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkbox Kullanımı")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() => isChecked = value!);
            },
          ),

          CheckboxListTile(
            title: const Text("Sözleşmeyi kabul ediyorum"),
            value: isChecked2,
            onChanged: (value) {
              setState(() => isChecked2 = value!);
            },
          ),

          Text(
            isChecked ? "Seçildi" : "Seçilmedi",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

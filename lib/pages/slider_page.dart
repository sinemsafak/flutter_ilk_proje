import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double value = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slider Kullanımı")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Slider(
            min: 0,
            max: 100,
            value: value,
            divisions: 10,
            label: value.toString(),
            onChanged: (newValue) {
              setState(() => value = newValue);
            },
          ),

          Text(
            "Değer: ${value.toStringAsFixed(0)}",
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// ================= PAGE =================

class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({super.key});

  @override
  State<GlobalKeyPage> createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {

  final GlobalKey<_CounterWidgetState> counterKey = GlobalKey();

  void increase() {
    counterKey.currentState?.increment();
  }

  void decrease() {
    counterKey.currentState?.decrement();
  }

  void reset() {
    counterKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GlobalKey Kullanımı"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CounterWidget(key: counterKey),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: increase,
                child: const Text("Arttır"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: decrease,
                child: const Text("Azalt"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: reset,
                child: const Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



/// ================= CHILD WIDGET =================

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  int counter = 0;

  void increment() {
    setState(() => counter++);
  }

  void decrement() {
    setState(() => counter--);
  }

  void reset() {
    setState(() => counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Sayaç: $counter",
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

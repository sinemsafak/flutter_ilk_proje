import 'package:flutter/material.dart';

class ControllerFocusStatefulPage extends StatefulWidget {
  @override
  State<ControllerFocusStatefulPage> createState() =>
      _ControllerFocusStatefulPageState();
}

class _ControllerFocusStatefulPageState
    extends State<ControllerFocusStatefulPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controller & FocusNode"),
      ),
      body: Center(
        child: Text("Sayfa çalışıyor"),
      ),
    );
  }
}

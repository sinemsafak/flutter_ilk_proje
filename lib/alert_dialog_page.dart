import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({super.key});

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlert();
    });
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Alert Dialog"),
        content: const Text("Sadece bu sayfa çalışıyor 🚀"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Alert Dialog Page"),
      ),
    );
  }
}

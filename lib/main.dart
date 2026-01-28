import 'package:flutter/material.dart';
import 'package:flutter_ilk_proje/alert_dialog_page.dart';
// import 'pages/snackbar_page.dart';
// import 'pages/bottom_sheet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AlertDialogPage(), // 👈 SADECE BURAYI DEĞİŞTİR
    );
  }
}

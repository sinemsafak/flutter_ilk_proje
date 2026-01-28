import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingToastPage extends StatelessWidget {
  const EasyLoadingToastPage({super.key});

  Future<void> _showLoading() async {
    EasyLoading.show(status: 'Yükleniyor...');
    await Future.delayed(const Duration(seconds: 2));
    EasyLoading.dismiss();
  }

  void _showSuccess() {
    EasyLoading.showSuccess('İşlem başarılı ✅');
  }

  void _showError() {
    EasyLoading.showError('Bir hata oluştu ❌');
  }

  void _showToast() {
    EasyLoading.showToast(
      'Bu bir toast mesajıdır 🍞',
      toastPosition: EasyLoadingToastPosition.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EasyLoading & Toast"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _showLoading,
              child: const Text("Loading Göster"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showSuccess,
              child: const Text("Success Toast"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showError,
              child: const Text("Error Toast"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _showToast,
              child: const Text("Normal Toast"),
            ),
          ],
        ),
      ),
    );
  }
}

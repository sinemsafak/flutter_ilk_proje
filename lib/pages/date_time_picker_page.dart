import 'package:flutter/material.dart';

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({super.key});

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  /// TARİH SEÇME
  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  /// SAAT SEÇME
  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  String formatDate(DateTime date) {
    return "${date.day}.${date.month}.${date.year}";
  }

  String formatTime(TimeOfDay time) {
    return "${time.hour}:${time.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarih ve Saat Seçme"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: pickDate,
              child: const Text("Tarih Seç"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickTime,
              child: const Text("Saat Seç"),
            ),

            const SizedBox(height: 40),

            if (selectedDate != null)
              Text(
                "Seçilen Tarih: ${formatDate(selectedDate!)}",
                style: const TextStyle(fontSize: 18),
              ),

            if (selectedTime != null)
              Text(
                "Seçilen Saat: ${formatTime(selectedTime!)}",
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

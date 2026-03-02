import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {

  /// STRING LISTE
  List<String> cities = [
    "İstanbul",
    "Ankara",
    "İzmir",
    "Bursa",
    "Antalya"
  ];

  String? selectedCity;

  /// MODEL LİSTE
  List<User> users = [
    User("Ahmet", 20),
    User("Mehmet", 25),
    User("Ayşe", 30),
  ];

  User? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropdownButton Kullanımı"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// STRING DROPDOWN
            DropdownButton<String>(
              hint: const Text("Şehir Seç"),
              value: selectedCity,
              isExpanded: true,
              items: cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedCity = value);
              },
            ),

            const SizedBox(height: 30),

            /// MODEL DROPDOWN
            DropdownButton<User>(
              hint: const Text("Kullanıcı Seç"),
              value: selectedUser,
              isExpanded: true,
              items: users.map((user) {
                return DropdownMenuItem(
                  value: user,
                  child: Text("${user.name} - ${user.age}"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedUser = value);
              },
            ),

            const SizedBox(height: 40),

            if (selectedCity != null)
              Text(
                "Seçilen Şehir: $selectedCity",
                style: const TextStyle(fontSize: 18),
              ),

            if (selectedUser != null)
              Text(
                "Seçilen Kullanıcı: ${selectedUser!.name}",
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}



/// MODEL SINIFI
class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

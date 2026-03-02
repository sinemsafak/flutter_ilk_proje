import 'package:flutter/material.dart';

class FormSaveResetGlobalKeyPage extends StatefulWidget {
  const FormSaveResetGlobalKeyPage({super.key});

  @override
  State<FormSaveResetGlobalKeyPage> createState() =>
      _FormSaveResetGlobalKeyPageState();
}

class _FormSaveResetGlobalKeyPageState
    extends State<FormSaveResetGlobalKeyPage> {

  /// GLOBAL KEY
  final _formKey = GlobalKey<FormState>();

  /// FORM VERİLERİ (Controller kullanmadan)
  String name = "";
  String email = "";
  String password = "";

  bool isSaved = false;

  void saveForm() {
    if (_formKey.currentState!.validate()) {

      /// TÜM onSaved ÇALIŞIR
      _formKey.currentState!.save();

      setState(() {
        isSaved = true;
      });

    }
  }

  void resetForm() {
    _formKey.currentState!.reset();

    setState(() {
      name = "";
      email = "";
      password = "";
      isSaved = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Save • Reset • GlobalKey"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              /// NAME
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Ad",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ad boş olamaz";
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),

              const SizedBox(height: 15),

              /// EMAIL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email boş olamaz";
                  }
                  if (!value.contains("@")) {
                    return "Geçerli email gir";
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),

              const SizedBox(height: 15),

              /// PASSWORD
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Şifre",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Şifre boş olamaz";
                  }
                  if (value.length < 6) {
                    return "En az 6 karakter";
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: saveForm,
                      child: const Text("Kaydet"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: resetForm,
                      child: const Text("Sıfırla"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (isSaved)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Text(
                          "Kaydedilen Bilgiler",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Ad: $name"),
                        Text("Email: $email"),
                        Text("Şifre: $password"),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

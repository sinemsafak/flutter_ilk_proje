import 'package:flutter/material.dart';

class TextFormFieldValidatorPage extends StatefulWidget {
  const TextFormFieldValidatorPage({super.key});

  @override
  State<TextFormFieldValidatorPage> createState() =>
      _TextFormFieldValidatorPageState();
}

class _TextFormFieldValidatorPageState
    extends State<TextFormFieldValidatorPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isSubmitted = false;
  String result = "";

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSubmitted = true;
        result =
            "Ad: ${nameController.text}\nEmail: ${emailController.text}";
      });
    } else {
      setState(() {
        isSubmitted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFormField & Validator Kullanımı"),
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
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Ad",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ad boş bırakılamaz";
                  }
                  if (value.length < 3) {
                    return "En az 3 karakter olmalı";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              /// EMAIL
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email boş bırakılamaz";
                  }
                  if (!value.contains("@")) {
                    return "Geçerli email giriniz";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              /// PASSWORD
              TextFormField(
                controller: passwordController,
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
                    return "En az 6 karakter olmalı";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: const Text("Gönder"),
                ),
              ),

              const SizedBox(height: 20),

              if (isSubmitted)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      result,
                      style: const TextStyle(fontSize: 16),
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

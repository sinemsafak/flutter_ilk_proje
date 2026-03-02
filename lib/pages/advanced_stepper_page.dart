import 'package:flutter/material.dart';

class AdvancedStepperPage extends StatefulWidget {
  const AdvancedStepperPage({super.key});

  @override
  State<AdvancedStepperPage> createState() => _AdvancedStepperPageState();
}

class _AdvancedStepperPageState extends State<AdvancedStepperPage> {

  int currentStep = 0;

  String name = "";
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  void continueStep() {
    if (currentStep == 0) {
      if (name.isEmpty) return;
    }

    if (currentStep == 1) {
      if (email.isEmpty) return;
    }

    if (currentStep < 2) {
      setState(() => currentStep++);
    } else {
      finishStepper();
    }
  }

  void cancelStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  }

  void finishStepper() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Tamamlandı"),
        content: Text("Hoşgeldin $name"),
      ),
    );
  }

  StepState getStepState(int step) {
    if (currentStep > step) return StepState.complete;
    if (currentStep == step) return StepState.editing;
    return StepState.indexed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gelişmiş Stepper"),
        centerTitle: true,
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepContinue: continueStep,
        onStepCancel: cancelStep,
        type: StepperType.vertical,
        controlsBuilder: (context, details) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(currentStep == 2 ? "Bitir" : "İleri"),
              ),
              const SizedBox(width: 10),
              if (currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text("Geri"),
                ),
            ],
          );
        },
        steps: [

          /// STEP 1
          Step(
            title: const Text("İsim"),
            state: getStepState(0),
            isActive: currentStep >= 0,
            content: TextField(
              decoration: const InputDecoration(
                labelText: "İsim",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => name = value,
            ),
          ),

          /// STEP 2
          Step(
            title: const Text("Email"),
            state: getStepState(1),
            isActive: currentStep >= 1,
            content: TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => email = value,
            ),
          ),

          /// STEP 3
          Step(
            title: const Text("Şifre"),
            state: getStepState(2),
            isActive: currentStep >= 2,
            content: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Şifre",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => password = value,
            ),
          ),
        ],
      ),
    );
  }
}

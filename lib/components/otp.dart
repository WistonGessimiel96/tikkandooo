import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController = TextEditingController();
  int secondsLeft = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("OTP Verification Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "An authentication code has been sent to (+88) 017234-44556",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: otpController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 24),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique de vérification de l'OTP
                print("OTP submitted: ${otpController.text}");
              },
              child: const Text("Next"),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Logique pour renvoyer l'OTP
                setState(() {
                  secondsLeft = 30; // Réinitialise le temps pour le renvoi
                });
              },
              child: const Text("Resend OTP"),
            ),
            const SizedBox(height: 10),
            Text("00:${secondsLeft.toString().padLeft(2, '0')} sec left"),
          ],
        ),
      ),
    );
  }
}

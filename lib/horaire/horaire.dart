import 'package:flutter/material.dart';

import '../components/widget/custom_divider.dart';

class HorairePage extends StatelessWidget {

  const HorairePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horaires du TR"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'lib/assets/img/trLigne.jpg',
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            customDivider(),
          ],
        ),
      ),
    );
  }
}
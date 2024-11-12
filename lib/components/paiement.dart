import 'package:flutter/material.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({Key? key}) : super(key: key);

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Méthode de Paiement"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PaymentOption(
              imageAsset: 'assets/orange_money.png', // Ajoutez votre icône pour Orange Money
              label: "Orange Money",
              selected: selectedPaymentMethod == "orange_money",
              onTap: () {
                setState(() {
                  selectedPaymentMethod = "orange_money";
                });
              },
            ),
            PaymentOption(
              imageAsset: 'assets/wave.png', // Ajoutez votre icône pour Wave
              label: "Wave",
              selected: selectedPaymentMethod == "wave",
              onTap: () {
                setState(() {
                  selectedPaymentMethod = "wave";
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (selectedPaymentMethod != null) {
                  // Action pour finaliser le paiement avec l'option sélectionnée
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Paiement avec $selectedPaymentMethod en cours...'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Veuillez sélectionner une méthode de paiement.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Payer Maintenant",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal[50],
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String imageAsset;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const PaymentOption({
    Key? key,
    required this.imageAsset,
    required this.label,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? Colors.teal.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? Colors.teal : Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Image.asset(
              imageAsset,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle, color: Colors.teal)
            else
              const Icon(Icons.radio_button_off, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

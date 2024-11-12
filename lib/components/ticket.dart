import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Ticket de Train TER"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.train, color: Colors.teal, size: 50),
                const SizedBox(height: 10),
                const Text(
                  'TER - Transport Express Régional',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text('Train N°: TER 410', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Départ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Dakar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("08:30", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.more_horiz, color: Colors.teal),
                        Text("1h 30min", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text("Arrivée", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Diamniadio", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("10:00", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 30, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Nom du Passager", style: TextStyle(color: Colors.grey)),
                        Text("Ornella AMA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Classe", style: TextStyle(color: Colors.grey)),
                        Text("Première", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Ticket N°", style: TextStyle(color: Colors.grey)),
                        Text("TER303", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 30, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Heure d'embarquement", style: TextStyle(color: Colors.grey)),
                        Text("08:15", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Voie", style: TextStyle(color: Colors.grey)),
                        Text("A1", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Wagon", style: TextStyle(color: Colors.grey)),
                        Text("10", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Siège", style: TextStyle(color: Colors.grey)),
                        Text("B4", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(height: 30, thickness: 1),
                const SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("(01)12345678901231", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Action pour télécharger le ticket
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Télécharger le Ticket",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.teal[50],
    );
  }
}

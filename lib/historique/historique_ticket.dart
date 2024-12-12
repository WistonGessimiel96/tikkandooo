import 'package:flutter/material.dart';
import 'package:tikkandoo/utils/app_colors.dart';

import '../components/ticket/listticket.dart';

class HistoriqueticketPage extends StatefulWidget {
  const HistoriqueticketPage({Key? key}) : super(key: key);

  @override
  State<HistoriqueticketPage> createState() => _HistoriqueticketPageState();
}

class _HistoriqueticketPageState extends State<HistoriqueticketPage> {
  final List<Ticket> tickets = [
    Ticket(
      departure: "Dakar",
      destination: "Colobane",
      departureLocation: "Dakar",
      destinationLocation: "Colobane",
      time: "08:00",
      duration: "5 min",
      price: "200 CFA",
      ticketNo: "TER001",
    ),
    Ticket(
      departure: "Colobane",
      destination: "Hann",
      departureLocation: "Colobane",
      destinationLocation: "Hann",
      time: "08:10",
      duration: "5 min",
      price: "200 CFA",
      ticketNo: "TER002",
    ),
    Ticket(
      departure: "Hann",
      destination: "Baux Maraîchers",
      departureLocation: "Hann",
      destinationLocation: "Baux Maraîchers",
      time: "08:20",
      duration: "5 min",
      price: "200 CFA",
      ticketNo: "TER003",
    ),
    Ticket(
      departure: "Baux Maraîchers",
      destination: "Pikine",
      departureLocation: "Baux Maraîchers",
      destinationLocation: "Pikine",
      time: "08:30",
      duration: "5 min",
      price: "200 CFA",
      ticketNo: "TER004",
    ),
    Ticket(
      departure: "Pikine",
      destination: "Thiaroye",
      departureLocation: "Pikine",
      destinationLocation: "Thiaroye",
      time: "08:40",
      duration: "5 min",
      price: "200 CFA",
      ticketNo: "TER005",
    ),
    Ticket(
      departure: "Thiaroye",
      destination: "Yeumbeul",
      departureLocation: "Thiaroye",
      destinationLocation: "Yeumbeul",
      time: "08:50",
      duration: "5 min",
      price: "200 CFA",
      ticketNo: "TER006",
    ),
    Ticket(
      departure: "Yeumbeul",
      destination: "Rufisque",
      departureLocation: "Yeumbeul",
      destinationLocation: "Rufisque",
      time: "09:00",
      duration: "10 min",
      price: "300 CFA",
      ticketNo: "TER007",
    ),
    Ticket(
      departure: "Rufisque",
      destination: "Bargny",
      departureLocation: "Rufisque",
      destinationLocation: "Bargny",
      time: "09:15",
      duration: "10 min",
      price: "300 CFA",
      ticketNo: "TER008",
    ),
    Ticket(
      departure: "Bargny",
      destination: "Diamniadio",
      departureLocation: "Bargny",
      destinationLocation: "Diamniadio",
      time: "09:30",
      duration: "10 min",
      price: "300 CFA",
      ticketNo: "TER009",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Historique des achats de ticket"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Recherchez votre station...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // Action pour le filtre (à définir)
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return TicketCard(ticket: tickets[index]);
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal[50],
    );
  }
}


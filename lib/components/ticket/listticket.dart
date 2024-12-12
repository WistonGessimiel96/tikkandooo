import 'package:flutter/material.dart';
import 'package:tikkandoo/utils/app_colors.dart';

import '../widget/custom_divider.dart';

class ListticketPage extends StatefulWidget {
  const ListticketPage({Key? key}) : super(key: key);

  @override
  State<ListticketPage> createState() => _ListticketPageState();
}

class _ListticketPageState extends State<ListticketPage> {
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
        title: const Text("Acheter un ticket"),
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

class Ticket {
  final String departure;
  final String destination;
  final String departureLocation;
  final String destinationLocation;
  final String time;
  final String duration;
  final String price;
  final String ticketNo;

  Ticket({
    required this.departure,
    required this.destination,
    required this.departureLocation,
    required this.destinationLocation,
    required this.time,
    required this.duration,
    required this.price,
    required this.ticketNo,
  });
}

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ticket.departure,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  ticket.destination,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(ticket.departureLocation),
                const Spacer(),
                Text(ticket.destinationLocation),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Départ ${ticket.time}"),
                const Spacer(),
                Text("N° Ticket ${ticket.ticketNo}"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(ticket.price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Navigation vers la page des détails
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDetailPage(ticket: ticket),
                      ),
                    );
                  },
                  child: const Text("Voir détails", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailPage({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du Ticket"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Image.asset(
              'lib/assets/img/train2.png',
              width: double.infinity,
            ),
            const SizedBox(height: 70),
            customDivider(),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Départ",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      ticket.departure,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.secondary),
                    ),
                  ],
                ),
                const SizedBox(width: 10,),
                Expanded(child: Column(children: [],)),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Destination",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      ticket.destination,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.secondary),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            customDivider(),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Passager",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      "Wiston Gessimiel",
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.secondary),
                    ),
                  ],
                ),
                const SizedBox(width: 10,),
                Expanded(child: Column(children: [],)),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Ticket N°",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      ticket.ticketNo,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.secondary),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            customDivider(),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Prix",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      ticket.price,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.secondary),
                    ),
                  ],
                ),
                const SizedBox(width: 10,),
                Expanded(child: Column(children: [],)),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Durée",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                    ),
                    Text(
                      ticket.duration,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.secondary),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

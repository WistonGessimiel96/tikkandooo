import 'package:flutter/material.dart';
import 'package:tikkandoo/utils/app_colors.dart';

class ListAbonnementPage extends StatefulWidget {
  const ListAbonnementPage({Key? key}) : super(key: key);

  @override
  State<ListAbonnementPage> createState() => _ListAbonnementPageState();
}

class _ListAbonnementPageState extends State<ListAbonnementPage> {
  final List<Abonnement> tickets = [
    Abonnement(
      departure: "Classic",
      destination: "1 semaine",
      departureLocation: "classe ECO",
      destinationLocation: "non partageable",
      time: "valide 1 mois",
      duration: "5 min",
      price: "5000 CFA",
      ticketNo: "TER001",
    ),
    Abonnement(
      departure: "Premium",
      destination: "2 semaines",
      departureLocation: "Classe ECO",
      destinationLocation: "partageable",
      time: "valide 1 mois",
      duration: "5 min",
      price: "10 000 CFA",
      ticketNo: "TER002",
    ),
    Abonnement(
      departure: "Diamand",
      destination: "1 mois",
      departureLocation: "1ere Classe",
      destinationLocation: "non partageable",
      time: "valide 1 mois",
      duration: "5 min",
      price: "20 000 CFA",
      ticketNo: "TER003",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Prendre un abonnement"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return AbonnementCard(ticket: tickets[index]);
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

class Abonnement {
  final String departure;
  final String destination;
  final String departureLocation;
  final String destinationLocation;
  final String time;
  final String duration;
  final String price;
  final String ticketNo;

  Abonnement({
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

class AbonnementCard extends StatelessWidget {
  final Abonnement ticket;

  const AbonnementCard({Key? key, required this.ticket}) : super(key: key);

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
                Text(" ${ticket.time}"),
                const Spacer(),
                Text("N° Abonnement: ${ticket.ticketNo}"),
              ],
            ),
            const SizedBox(height: 8),
           /* Row(
              children: [
                Text(ticket.price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Navigation vers la page des détails
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDetailPage(ticket: ticket),
                      ),
                    );*/
                  },
                  child: const Text("Voir détails", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}

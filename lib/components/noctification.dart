import 'package:flutter/material.dart';

class NoctificationPage extends StatefulWidget {
  const NoctificationPage({super.key});

  @override
  State<NoctificationPage> createState() => _NoctificationPageState();
}

class _NoctificationPageState extends State<NoctificationPage> {
  final List<Map<String, String>> notifications = [
    {"name": "Client 1", "action": "a acheté un ticket", "post": "Dakar à Diamniadio", "time": "il y a environ 1 heure"},
    {"name": "Client 2", "action": "a acheté un ticket", "post": "Blaise Diagne à Dakar", "time": "il y a environ 2 heures"},
    {"name": "Client 3", "action": "a acheté un ticket", "post": "Thiaroye à Dakar", "time": "il y a environ 3 heures"},
    {"name": "Client 4", "action": "a annulé son ticket", "post": "Dakar à Diamniadio", "time": "il y a environ 4 heures"},
    {"name": "Client 5", "action": "a acheté un ticket", "post": "Aéroport à Diamniadio", "time": "il y a environ 5 heures"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Notifications"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.train, color: Colors.white),
              ),
              title: Text(
                "${notification['name']} ${notification['action']}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${notification['post']}\n${notification['time']}",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              trailing: Icon(Icons.circle, color: Colors.green, size: 12.0),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

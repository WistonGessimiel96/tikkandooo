import 'package:flutter/material.dart';
import 'package:tikkandoo/components/P404.dart';
import 'package:tikkandoo/components/home.dart';
import 'package:tikkandoo/components/listticket.dart';
import 'package:tikkandoo/components/login.dart';
import 'package:tikkandoo/components/noctification.dart';
import 'package:tikkandoo/components/paiement.dart';
import 'package:tikkandoo/components/ticket.dart';
import 'package:tikkandoo/components/tuto2.dart';
import 'components/SignUpPage.dart';
import 'components/otp.dart';
import 'components/register.dart';
import 'components/tuto1.dart';
import 'components/SignUpPage.'; // Ajoutez l'import de SignUpPage ici.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Aller sur la page Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text("Aller sur la page Register"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tuto1Page()),
                );
              },
              child: const Text("Aller sur la page Tuto1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OtpPage()),
                );
              },
              child: const Text("Aller sur la page OTP"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("Aller sur la page Home"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaiementPage()),
                );
              },
              child: const Text("Aller sur la page Paiement"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const P404Page()),
                );
              },
              child: const Text("Aller sur la page P404"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tuto2Page()),
                );
              },
              child: const Text("Aller sur la page Tuto2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TicketPage()),
                );
              },
              child: const Text("Aller sur la page Ticket"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoctificationPage()),
                );
              },
              child: const Text("Aller sur la page Noctification"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListticketPage()),
                );
              },
              child: const Text("Aller sur la page ListTicket"),
            ),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page SignUpPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()), // Ajoutez cette ligne
                );
              },
              child: const Text("Aller sur la page Inscription"), // Lien vers la page SignUp
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

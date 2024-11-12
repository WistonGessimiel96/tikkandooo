import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D4D4D), // Couleur de fond de la page
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo de l'application
              Image.asset(
                'assets/logo.png', // Assurez-vous d'avoir un logo dans le dossier assets
                height: 100,
              ),
              const SizedBox(height: 20),

              // Texte d'accueil
              const Text(
                "TER",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Texte de sous-titre
              const Text(
                "Bienvenue dans notre TER\nApplication mobile de réservation de billets",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Description
              const Text(
                "Réservez partout au Sénégal en un seul tap,\net profitez de votre quotidien.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 30),

              // Bouton "Sign In"
              ElevatedButton(
                onPressed: () {
                  // Logique de connexion
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50), // Largeur max
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                    color: Color(0xFF0D4D4D),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Bouton "Sign Up"
              ElevatedButton(
                onPressed: () {
                  // Logique d'inscription
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Texte "Already have an account? Sign Up"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous avez déjà un compte?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      // Action pour rediriger vers Sign Up
                    },
                    child: const Text(
                      "Se connecter",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tikkandoo/components/register/register.dart';
import 'package:tikkandoo/utils/app_colors.dart';

import 'login/login.dart';

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
                "TIKKANDOO",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Texte de sous-titre
              const Text(
                "Bienvenue sur TIKKANDOO,\n Votre application de réservation de tickets TER",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  minimumSize: const Size(double.infinity, 50), // Largeur max
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Creer un compte",
                  style: TextStyle(
                    color: Color(0xFF0D4D4D),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vous avez déjà un compte?",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Bouton "Sign Up"
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
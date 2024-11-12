import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _termsAccepted = false;

  // Cette méthode sera appelée lorsque l'utilisateur appuie sur le bouton d'inscription
  void _onSignUpPressed() {
    if (_termsAccepted) {
      // Si les conditions sont acceptées, on redirige l'utilisateur vers la page d'inscription
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    } else {
      // Affiche un message si l'utilisateur n'a pas accepté les conditions
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vous devez accepter les conditions d\'utilisation.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3C40), // Dark background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Icon(
                    Icons.train, // Train icon instead of airplane
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "TER",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Créez votre nouveau compte",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Découvrez le monde au bout de vos doigts avec notre application mobile de réservation de billets!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom complet',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Clifton Simmons',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Numéro de téléphone',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '+8801234-44556',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone, color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'example@gmail.com',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '****',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmer le mot de passe',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '****',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "En créant un compte, vous acceptez nos conditions d'utilisation et notre politique de confidentialité.",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _onSignUpPressed, // Call the method when pressed
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button color
                      foregroundColor: const Color(0xFF1A3C40), // Text color
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("S'inscrire"),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.apple, color: Colors.white)
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.g_mobiledata, color: Colors.white)
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook, color: Colors.white)
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to login page
                    },
                    child: const Text(
                      "Vous avez déjà un compte ? Connectez-vous",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Nouvelle page d'inscription que l'utilisateur verra après avoir accepté les conditions
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'inscription"),
      ),
      body: Center(
        child: const Text(
          "Bienvenue dans la page d'inscription !",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

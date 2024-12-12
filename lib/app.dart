import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikkandoo/components/P404.dart';
import 'package:tikkandoo/components/home.dart';
import 'package:tikkandoo/components/ticket/listticket.dart';
import 'package:tikkandoo/components/login/login.dart';
import 'package:tikkandoo/components/noctification.dart';
import 'package:tikkandoo/components/paiement.dart';
import 'package:tikkandoo/components/ticket.dart';
import 'package:tikkandoo/components/tuto2.dart';
import 'package:tikkandoo/route/router.dart';
import 'package:tikkandoo/utils/app_colors.dart';
import 'package:tikkandoo/utils/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/SignUpPage.dart';
import 'components/otp.dart';
import 'components/register/register.dart';
import 'components/tuto1.dart';
import 'utils/global_vars.dart';

class App extends StatefulWidget {
  final AppRouter router;
  const App({Key? key, required this.router}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
  //  _configOneSignal();
    _configLoading();
    super.initState();
  }

  _configLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..radius = 10.0
      ..backgroundColor = Colors.white
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
      builder: EasyLoading.init(),
      theme: TikkandooTheme.lightTheme,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      navigatorObservers: [NavigationObserver()],
      initialRoute: '/',
      supportedLocales: const [Locale('fr', 'FR')],
      onGenerateRoute: widget.router.generateRoute,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              var prefs = snapshot.data;
              var jsonData = prefs?.getString("user");
              if (jsonData != null) {
                var user = json.decode(jsonData);
                currentUser = user;
                // print("user:===> ${user['access_token']}");
                // return const HomePreloadPage();
                return const HomePage();
                //return const TabsPage();
              } else {
                //return const AuthLoginEmailPage();
                return const HomePage();
              }
            } else {
              //return const AuthLoginEmailPage();
              return const HomePage();
            }
          }
          return Container(
            color: AppColors.primary,
            alignment: Alignment.center,
            child: Image.asset('lib/assets/img/logo.png', width: 240.0),
          );
        },
      ),
    );
  }

}

class NavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      print('Navigated to ${route.settings.name}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('Navigated back from ${route.settings.name}');
  }

}


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
           /* ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text("Aller sur la page Register"),
            ),*/
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

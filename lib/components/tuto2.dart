
import 'package:flutter/material.dart';

class Tuto2Page extends StatefulWidget {
  const Tuto2Page({super.key});
  @override
  State<Tuto2Page> createState() => _Tuto2PageState();
}

class _Tuto2PageState extends State<Tuto2Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tuto2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'this is the Tuto2 page',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
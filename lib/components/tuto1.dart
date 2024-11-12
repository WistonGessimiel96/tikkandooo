
import 'package:flutter/material.dart';

class Tuto1Page extends StatefulWidget {
  const Tuto1Page({super.key});
  @override
  State<Tuto1Page> createState() => _Tuto1PageState();
}

class _Tuto1PageState extends State<Tuto1Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tuto1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'this is the tuto1 page',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
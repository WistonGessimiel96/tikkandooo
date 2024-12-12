import 'package:flutter/material.dart';

Widget customDivider() {
  return const Divider(color: Color.fromARGB(255, 192, 192, 192), height: 1);
}

Widget customVerticalDivider(double height) {
  return Container(
    width: 1,
    height: height,
    color: Colors.grey,
  );
}

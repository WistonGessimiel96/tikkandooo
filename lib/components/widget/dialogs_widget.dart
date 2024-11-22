

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import '../../utils/app_colors.dart';
import 'animations/fade_animations.dart';
import 'custom_button_widget.dart';

Future<Future> dialogError(BuildContext context,
    {required String code,
      required String message,
      Color color = AppColors.danger,
      dynamic additionalData}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Vibration.vibrate();
      return AlertDialog(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
        titlePadding: const EdgeInsets.all(16),
        content: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(alignment: Alignment.topCenter, children: [
                  Transform.translate(
                    offset: const Offset(0, 45),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 55, left: 16, right: 16, bottom: 75),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            message,
                            style: const TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                      child: Card(
                        elevation: 0,
                        color: AppColors.danger,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: SizedBox(
                          width: 85,
                          height: 85,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.dangerous_outlined,
                                size: 65, color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
        actions: [
          Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                children: <Widget>[
                    Expanded(
                        child: CustomButton(
                          title: "Fermer",
                          onPress: () {
                              Navigator.of(context).pop();
                          },
                          color: AppColors.danger,
                        )),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class PinCodeInput extends StatefulWidget {
  final TextEditingController ctlr;
  FocusNode focus = FocusNode();
  final handleSelected;
  final autofocus;

  PinCodeInput(this.ctlr, {Key? key, required this.focus, this.handleSelected,  this.autofocus})
      : super(key: key);

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  String text = "";
  int maxLength = 4;

  _PinCodeInputState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            dotField(0),
            const SizedBox(width: 6),
            dotField(1),
            const SizedBox(width: 6),
            dotField(2),
            const SizedBox(width: 6),
            dotField(3),
          ],
        ),
        Opacity(
          opacity: 0,
          child: SizedBox(
            height: 100.0,
            child: TextField(
                focusNode: widget.focus,
                controller: widget.ctlr,
                autofocus: widget.autofocus ?? true,
                maxLength: maxLength,
                obscureText: true,
                keyboardType: TextInputType.number,
                enableInteractiveSelection: false,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                  fillColor: AppColors.primary,
                  filled: true,
                ),
                onChanged: (text) => {
                  if (mounted) widget.handleSelected(text),
                  setState(() => this.text = text),
                }),
          ),
        )
      ],
    );
  }

  Widget dotField(int index) {
    String text = "";
    String value = widget.ctlr.text;
    if (value.length >= index + 1) {
      text = "⬤";
    }
    if (value.length == index) {
    } else if (value.length == index + 1 && value.length == maxLength) {
    } else {}
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color: AppColors.secondary, width: 1.5),
            color: AppColors.white),
        child: Text(text, style: const TextStyle(color: AppColors.primary)),
      ),
    );
  }
}

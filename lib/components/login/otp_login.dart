import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tikkandoo/components/login/otp_login.dart';
import 'package:tikkandoo/utils/app_colors.dart';
import '../../utils/global_vars.dart';
import '../widget/dialogs_widget.dart';
import '../widget/pincode_widget.dart';

class OtpLoginPage extends StatefulWidget {
  final String user;

  const OtpLoginPage({Key? key, required this.user}) : super(key: key);

  @override
  State<OtpLoginPage> createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController _pinCtlr = TextEditingController();

  final FocusNode _oldPinFocus = FocusNode();

  FocusNode phoneNode = FocusNode();
  FocusNode pinFocus = FocusNode();
  FocusNode myFocusNode = FocusNode();

  bool autovalidate = false;
  bool isActivated = true;
  bool isSetPin = true;
  bool show = false;

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
    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    'lib/assets/img/logoBlanc.png',
                    width: double.infinity,
                  ),
                  GestureDetector(
                    onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                             Text(
                              "Veuillez saisir le code OTP envoyé sur votre numéro.",
                              style: TextStyle(fontSize: 12, color: AppColors.white),
                            ),
                             Text(
                               widget.user,
                              style: TextStyle(fontSize: 20, color: AppColors.secondary, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        "Code OTP",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 8),
                                      TextField(
                                        controller: _pinCtlr,
                                        decoration: const InputDecoration(
                                          labelText: '',
                                          labelStyle: TextStyle(color: Colors.white),
                                          hintText: '',
                                          hintStyle: TextStyle(color: Colors.white70),
                                          filled: true,
                                          fillColor: Colors.white12,
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.password, color: Colors.white),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.secondary)),
                                        ),
                                        style: const TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: const Color(0xFF1A3C40),
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Valider", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}

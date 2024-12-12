import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tikkandoo/components/login/otp_login.dart';
import 'package:tikkandoo/utils/app_colors.dart';
import '../../utils/global_vars.dart';
import '../widget/dialogs_widget.dart';
import '../widget/pincode_widget.dart';

class LoginPincodePage extends StatefulWidget {
  final String user;

  const LoginPincodePage({Key? key, required this.user}) : super(key: key);

  @override
  State<LoginPincodePage> createState() => _LoginPincodePageState();
}

class _LoginPincodePageState extends State<LoginPincodePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController _pinCtlr = TextEditingController();
  late final TextEditingController _pinCtlr2 = TextEditingController();

  final FocusNode _oldPinFocus = FocusNode();
  final FocusNode _newPinConfirmFocus = FocusNode();

  bool _isTypePasswordSwitched = false;
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
      body: SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "Veuillez saisir votre code pin.",
                        style: TextStyle(fontSize: 12, color: AppColors.white),
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
                                  "Code PIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 8),
                                PinCodeInput(_pinCtlr, focus: _oldPinFocus,
                                    handleSelected: (value) {
                                      if(value.length == 4){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>   OtpLoginPage(user: widget.user,),
                                          ),
                                        );
                                      }
                                    }),
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
    );
  }

/*Future _requestOtp(context) async {
    String data = jsonEncode({
      "phone": jsonDecode(widget.user)['phone'],
      "country": jsonDecode(widget.user)['country']
    });
    try {
      EasyLoading.show(indicator: showWizallLogo());
      await _authRepository.customerSendOtp(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var xid = Xid();
      prefs.setString('xid', xid.toString());
      prefs.setString('pin', Cipher().xorEncode(_pinCtlr.text, secretKey: xid.toString()));
      EasyLoading.dismiss();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginActivatePage(
                user: widget.user, pinCode: _pinCtlr.text)),
      );
    } catch (error) {
      error as Map;
      EasyLoading.dismiss();
      dialogError(context,
          code: error['code'].toString(),
          message: error['message'] ?? error['error'],
          color: AppColors.danger);
    }
  }*/
}

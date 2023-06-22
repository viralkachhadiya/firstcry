import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_task/core/utills/shared_preference.dart';
import 'package:demo_task/core/utills/snack_bar.dart';
import 'package:demo_task/core/widgets/common_appbar.dart';
import 'package:demo_task/core/widgets/rectangle_button.dart';
import 'package:demo_task/features/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class RegisterOtpVerify extends StatefulWidget {
  final String verificationId;
  final String email;
  final String mobileNumber;
  final String password;
  final String fullName;

  const RegisterOtpVerify({
    Key? key,
    required this.verificationId,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.fullName,
  }) : super(key: key);

  @override
  State<RegisterOtpVerify> createState() => _RegisterOtpVerifyState();
}

class _RegisterOtpVerifyState extends State<RegisterOtpVerify> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 56,
        height: 1.5,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 50,
        height: 1,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                      ),
                      Text(
                        "Verification",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey.withOpacity(0.1),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.2), width: 1.4),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We've sent the same OTP on your:",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Text.rich(TextSpan(
                                text: "Registered Mobile No ",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.mobileNumber,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: " and"),
                                ],
                              )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              height: 4,
                              width: 4,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              child: Text.rich(TextSpan(
                                text: "Email ID ",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.email,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Pinput(
              onChanged: (val) {},
              validator: (val) {
                if (val?.isEmpty ?? true) {
                  return "Please Enter OTP";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              length: 6,
              showCursor: true,
              cursor: cursor,
              pinAnimationType: PinAnimationType.fade,
              preFilledWidget: preFilledWidget,
              defaultPinTheme: PinTheme(
                height: 55,
                width: 46,
                textStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
              disabledPinTheme: PinTheme(
                width: 46,
                height: 55,
                textStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                "Trying to auto capture",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            RectangleButton(
                text: "Submit".toUpperCase(),
                isLoading: isLoading,
                radius: 4,
                onPressed: () async {
                  if (_pinPutController.text.length == 6) {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: _pinPutController.text);

                      final User userDetails =
                          (await firebaseAuth.signInWithCredential(credential))
                              .user!;

                      await userDetails.updateEmail(widget.email);
                      await userDetails.updatePassword(widget.password);
                      final DocumentReference r = FirebaseFirestore.instance
                          .collection("demo-user")
                          .doc(userDetails.uid);
                      await r.set({
                        "fullName": widget.fullName,
                        "email": widget.email,
                        "uid": userDetails.uid,
                        "number": widget.mobileNumber,
                        "password": widget.password,
                      });
                      setIsLoggedIn(true);
                      openSnackbar(
                          context, "Register Successfully.", Colors.green);
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) => HomeScreen(),
                          ),
                          (route) => false);
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      switch (e.code) {
                        case "account-exists-with-different-credential":
                          openSnackbar(
                              context,
                              "You already have an account with us. Use correct provider",
                              Colors.red);
                          break;

                        case "null":
                          openSnackbar(
                              context,
                              "Some unexpected error while trying to sign in",
                              Colors.red);
                          break;
                        default:
                          openSnackbar(context, e.toString(), Colors.red);
                      }
                    } on Failure catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      openSnackbar(context, e.message, Colors.red);
                    }
                  }
                }),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

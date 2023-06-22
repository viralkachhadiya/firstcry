import 'package:demo_task/core/utills/snack_bar.dart';
import 'package:demo_task/core/widgets/common_appbar.dart';
import 'package:demo_task/core/widgets/rectangle_button.dart';
import 'package:demo_task/features/register/register_verify_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class Register extends StatefulWidget {
  final firebase_auth.User? googleUser;

  const Register({
    Key? key,
    this.googleUser,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisible = false;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState(){
    print("aaaa check 1");
    if (widget.googleUser != null) {
      nameController =
          TextEditingController(text: widget.googleUser!.displayName ?? "");
      emailController =
          TextEditingController(text: widget.googleUser!.email ?? "");
      mobileNumberController =
          TextEditingController(text: widget.googleUser!.phoneNumber ?? "");
    }

    super.initState();
  }

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
                        "Register",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  controller: nameController,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Please Enter Full Name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter your Full Name",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    errorMaxLines: 3,
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mobile Number",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 46,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        controller: TextEditingController(text: '+91'),
                        readOnly: true,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Enter your Mobile Number",
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          errorMaxLines: 3,
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        controller: mobileNumberController,
                        validator: (val) {
                          if (val?.isEmpty ?? true) {
                            return "Please Enter Mobile Number";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Enter your Mobile Number",
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          errorMaxLines: 3,
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "OTP will sent on this Mobile No. for verification.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email ID",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  controller: emailController,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Please Enter Email ID";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter your Email ID",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    errorMaxLines: 3,
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  obscureText: isVisible,
                  controller: passwordController,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Please Enter Password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter your Password",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                    suffixIconConstraints: BoxConstraints(maxHeight: 24),
                    errorMaxLines: 3,
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Password must be at least 8 characters long with 1 Uppercase, 1 Lowercase & 1 Numeric character.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            RectangleButton(
              text: "Continue".toUpperCase(),
              radius: 4,
              isLoading: isLoading,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    await firebaseAuth.verifyPhoneNumber(
                      phoneNumber: "+91${mobileNumberController.text}",
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        final User? user = await firebaseAuth
                            .signInWithCredential(credential)
                            .then((value) {
                          print("You are logged in successfully ");
                        });
                        print(
                            "You are logged in successfully 123 ${user?.phoneNumber} ");
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        setState(() {
                          isLoading = false;
                        });
                        debugPrint("Error: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            action: SnackBarAction(
                              label: "OK",
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                            content: Text(
                              e.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                        // openSnackbar(context, e.toString(), Colors.red);
                        // throw Failure(e.message ?? "Connection Time-out!");
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                RegisterOtpVerify(
                              verificationId: verificationId,
                              password: passwordController.text,
                              mobileNumber: mobileNumberController.text,
                              email: emailController.text,
                              fullName: nameController.text,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        throw Failure("Connection Time-out!");
                      },
                    );
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
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    debugPrint(e.toString());
                    openSnackbar(context, e.toString(), Colors.red);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

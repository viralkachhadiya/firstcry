import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_task/core/model/login_response.dart';
import 'package:demo_task/core/model/user_model.dart';
import 'package:demo_task/core/provider/internet_provider.dart';
import 'package:demo_task/core/utills/shared_preference.dart';
import 'package:demo_task/core/utills/snack_bar.dart';
import 'package:demo_task/core/widgets/common_appbar.dart';
import 'package:demo_task/core/widgets/rectangle_button.dart';
import 'package:demo_task/features/home/home.dart';
import 'package:demo_task/features/login/login_otp_verify.dart';
import 'package:demo_task/features/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isGoogleLoading = false;
  bool isFbLoading = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login / Register",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Mobile No.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  controller: emailController,
                  validator: (val) {
                    if (val?.isEmpty ?? true) {
                      return "Please Enter Mobile No";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter your Mobile No.",
                    hintStyle: const TextStyle(
                      fontSize: 15,
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
                SizedBox(
                  height: 44,
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
                        if (emailController.text
                            .startsWith(RegExp(r'^[0-9]+$'))) {
                        } else {
                          print("email12345");
                        }
                        String dataEmail = '';
                        String dataMobile = '';
                        QuerySnapshot<Map<String, dynamic>> snap =
                            await FirebaseFirestore.instance
                                .collection('demo-user')
                                .get();
                        final userList = snap.docs
                            .map(
                              (e) => UserModel.fromJson(e.data()),
                            )
                            .toList();
                        UserModel? userModel;
                        if (emailController.text
                            .startsWith(RegExp(r'^[0-9]+$'))) {
                          userModel = userList.firstWhere(
                            (element) => element.number == emailController.text,
                            orElse: () => const UserModel(
                              password: '',
                              email: '',
                              number: '',
                              fullName: '',
                              uid: '',
                            ),
                          );
                        } else {
                          userModel = userList.firstWhere(
                            (element) => element.email == emailController.text,
                            orElse: () => const UserModel(
                              password: '',
                              email: '',
                              number: '',
                              fullName: '',
                              uid: '',
                            ),
                          );
                        }
                        if (userModel.uid.isEmpty) {
                          throw Failure("Registered Required");
                        } else {
                          final FirebaseAuth firebaseAuth =
                              FirebaseAuth.instance;
                          if (emailController.text
                              .startsWith(RegExp(r'^[0-9]+$'))) {
                            String verificationId;
                            firebaseAuth.verifyPhoneNumber(
                              phoneNumber: "+91${emailController.text}",
                              verificationCompleted:
                                  (PhoneAuthCredential credential) async {
                                final User? user = await firebaseAuth
                                    .signInWithCredential(credential)
                                    .then((value) {
                                  print("You are logged in successfully ");
                                });
                                setState(() {
                                  isLoading = false;
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
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginOtpVerify(
                                      verificationId: verificationId,
                                      email: userModel!.email,
                                      mobileNumber: userModel.number,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                throw Failure("Connection Time-out!");
                              },
                            );
                          } else {
                            var acs = ActionCodeSettings(
                              // URL you want to redirect back to. The domain (www.example.com) for this
                              // URL must be whitelisted in the Firebase Console.
                                url: 'https://nzcafe.page.link',
                                // This must be true
                                handleCodeInApp: true,
                                iOSBundleId: 'com.google.firebase.flutterauth',
                                androidPackageName: 'com.google.firebase.flutterauth',
                                // installIfNotAvailable
                                androidInstallApp: true,
                                // minimumVersion
                                androidMinimumVersion: '12');
                            FirebaseAuth.instance
                                .sendSignInLinkToEmail(
                                    email: emailController.text,
                                    actionCodeSettings: acs)
                                .catchError((onError) {
                                  print(
                                  'Error sending email verification $onError');
                                  throw Failure(onError.toString());

                                })
                                .then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  print(
                                    'Successfully sent email verification ');
                                },
                            );
                          }
                        }
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
                      } on FirebaseException catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        openSnackbar(context, e.message, Colors.red);
                      } on Failure catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        openSnackbar(context, e.message, Colors.red);
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 0.2,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 0.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RectangleButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/google_logo.png',
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  radius: 4,
                  elevation: 0,
                  isLoading: isGoogleLoading,
                  buttonColor: Theme.of(context).scaffoldBackgroundColor,
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4), width: 1.4),
                  onPressed: () async {
                    try {
                      setState(() {
                        isGoogleLoading = true;
                      });
                      final ip = context.read<InternetProvider>();
                      final GoogleSignIn googleSignIn = GoogleSignIn();
                      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                      await ip.checkInternetConnection();
                      print("googleSignInAccount 123");
                      if (ip.hasInternet == false) {
                        throw Failure("Check your Internet connection");
                      } else {
                        final GoogleSignInAccount? googleSignInAccount =
                        await googleSignIn.signIn();
                        if (googleSignInAccount != null) {
                          print("googleSignInAccount 123");
                          final GoogleSignInAuthentication
                          googleSignInAuthentication =
                          await googleSignInAccount.authentication;
                          final AuthCredential credential =
                          GoogleAuthProvider.credential(
                            accessToken: googleSignInAuthentication.accessToken,
                            idToken: googleSignInAuthentication.idToken,
                          );

                          /// signing to firebase user instance
                          final User userDetails =
                          (await firebaseAuth.signInWithCredential(credential))
                              .user!;
                          DocumentSnapshot snap = await FirebaseFirestore.instance
                              .collection('demo-user')
                              .doc(userDetails.uid)
                              .get();
                          if (snap.exists) {
                            /// user exists
                            await FirebaseFirestore.instance
                                .collection('demo-user')
                                .doc(userDetails.uid)
                                .get()
                                .then((DocumentSnapshot snapshot) => {
                              setLoginResponse(LoginResponse(uid: snapshot['uid'], email: snapshot['email'], number: snapshot['number'],name:snapshot['fullName'] )),
                            });
                            setIsLoggedIn(true);
                            setState(() {
                              isGoogleLoading = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (BuildContext context) => HomeScreen(),
                              ),
                            );
                          }else {
                            print("googleSignInAccount 123");
                            setState(() {
                              isGoogleLoading = false;
                            });
                            /// Go to Sign-Up Screen
                            ///
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (BuildContext context) => Register(googleUser: userDetails,),
                              ),
                            );
                          }
                        } else {
                          throw Failure("Google Account Not Found.");
                        }
                      }
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        isGoogleLoading = false;
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
                        isGoogleLoading = false;
                      });
                      openSnackbar(context, e.message, Colors.red);
                    }
                  },
                  textColor: Colors.black,
                  text: '',
                ),
                SizedBox(
                  height: 10,
                ),
                RectangleButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/fb_logo.png',
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Continue with Facebook",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  radius: 4,
                  elevation: 0,
                  buttonColor: Theme.of(context).scaffoldBackgroundColor,
                  borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.4), width: 1.4),
                  onPressed: () {
                    openSnackbar(context, "Required Facebook Developer Credential.", Colors.red);
                  },
                  textColor: Colors.black,
                  text: '',
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text.rich(TextSpan(
                    text: "New to FirstCry? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                    children: [
                      TextSpan(
                        text: "Register Here",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()),
                            );
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 0.2,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(TextSpan(
                  text: "By continuing, you agree to Firstcry's ",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: "Conditions od Use ",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: "and ",
                    ),
                    TextSpan(
                      text: "Privacy Notice.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

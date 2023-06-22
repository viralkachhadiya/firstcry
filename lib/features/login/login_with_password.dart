import 'package:demo_task/core/utills/shared_preference.dart';
import 'package:demo_task/core/utills/snack_bar.dart';
import 'package:demo_task/core/widgets/common_appbar.dart';
import 'package:demo_task/core/widgets/rectangle_button.dart';
import 'package:demo_task/features/home/home.dart';
import 'package:demo_task/features/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWithPassword extends StatefulWidget {
  final String email;
  final String mobile;
  const LoginWithPassword({Key? key, required this.email, required this.mobile}) : super(key: key);

  @override
  State<LoginWithPassword> createState() => _LoginWithPasswordState();
}

class _LoginWithPasswordState extends State<LoginWithPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,size: 22,),
                      Text(
                        "Login",
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
            SizedBox(height: 20,),
            Text.rich(
              TextSpan(
                text: widget.mobile,
                style: TextStyle(
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: " Edit",
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
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
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Enter your Password",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 24
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
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Text(
                        "Forget Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16,),
            RectangleButton(
              text: "Login with password".toUpperCase(),
              isLoading: isLoading,
              radius: 4,
              onPressed: () async {
                if(formKey.currentState!.validate()){
                  try{
                    setState(() {
                      isLoading = true;
                    });
                    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    await  firebaseAuth.signInWithEmailAndPassword(
                        email: widget.email, password: passwordController.text,
                    );
                    setIsLoggedIn(true);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                    );

                  }on FirebaseAuthException catch (e) {
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
                    openSnackbar(context, e.message, Colors.red);
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

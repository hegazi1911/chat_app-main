import 'package:chat_app/Helper/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Helper/custom_button.dart';
import '../Helper/snack_par.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 57, 3, 78),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Image.asset('assets/Images/scholar.png'),
                ),
                const Text(
                  "scholar",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 30,
                      color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Sign In',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Pacifico',
                              color: Colors.white)),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: textFormField(
                          "Email",
                          onTextchanged: (String data) {
                            email = data;
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: textFormField("Password",
                            onTextchanged: (String data) {
                          password = data;
                        }, obscureText: true)),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CustomButton(
                          text: " Sign in",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                var auth = FirebaseAuth.instance;

                                await auth.signInWithEmailAndPassword(
                                    email: email!, password: password!);
                                showSnackBar(context, "success");
                                Navigator.pushNamed(context, "ChatPage",
                                    arguments: email);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  showSnackBar(
                                      context, "No user found for that email.");
                                } else if (e.code == 'wrong-password') {
                                  showSnackBar(context,
                                      'Wrong password provided for that user.');
                                }
                              }
                              isLoading = false;
                              setState(() {});
                            } else {
                              showSnackBar(context, "wrong");
                            }
                          },
                        )),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Dont Have Account ? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "Register");
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.cyan,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

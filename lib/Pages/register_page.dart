import 'package:chat_app/Helper/snack_par.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Helper/custom_button.dart';
import '../Helper/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 75, 41),
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
                      child: Text('Register',
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
                      child: textFormField("password",
                          onTextchanged: (String data) {
                        password = data;
                      }, obscureText: true),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CustomButton(
                          text: " Rigister",
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                var auth = FirebaseAuth.instance;

                                await auth.createUserWithEmailAndPassword(
                                    email: email!, password: password!);
                                showSnackBar(context, "success");
                                Navigator.pushNamed(context, "ChatPage");
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showSnackBar(context, "week password");
                                } else if (e.code == 'email-already-in-use') {
                                  showSnackBar(context, "Email already use");
                                }
                              }
                              isLoading = false;
                              setState(() {});
                            } else {}
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
                        "Already Have Account ? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "   LogIn",
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

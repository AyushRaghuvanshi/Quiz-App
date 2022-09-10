import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/database/post.dart';
import 'package:gdsc/views/popup.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _email;
  late TextEditingController _name;
  late TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _name = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const width = 325.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFF252b3f)),
            height: 900,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
                    child: Text("Create Account",
                        style: TextStyle(
                          fontSize: 35,
                          color: Color(0xFFe68330),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email ID:",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: width,
                          child: TextField(
                            controller: _email,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Enter you email here"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Name:",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: width,
                          child: TextField(
                            controller: _name,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Enter you name here"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Password:",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: width,
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            autocorrect: false,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Enter you password here"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: Container(
                      width: width,
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFe68330),
                          ),
                          onPressed: () async {
                            final name = _name.text;
                            final email = _email.text;
                            final password = _password.text;
                            if (email == '' && password == '') {
                              await showErrorPopup(context,
                                  'Please enter your Email ID and Password');
                              return;
                            } else if (email == '') {
                              await showErrorPopup(
                                  context, 'Please enter you Email ID');
                              return;
                            } else if (password == '') {
                              await showErrorPopup(
                                  context, 'Please enter you Password');
                              return;
                            }

                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              final user = FirebaseAuth.instance.currentUser;

                              adduser(user?.uid, name);
                            } on FirebaseAuthException catch (e) {
                              switch (e.code) {
                                case 'email-already-in-use':
                                  await showErrorPopup(context,
                                      'You have already registered. Try logging in');
                                  return;
                                case 'invalid-email':
                                  await showErrorPopup(
                                      context, 'Enter a valid Email ID ');
                                  return;
                                case 'weak-password':
                                  await showErrorPopup(context,
                                      'Password should be at least contain 5 character.');
                                  return;
                                case 'unknown':
                                  await showErrorPopup(context,
                                      'Opps, looks like an Error occured. Please contant the Dev');
                                  return;
                              }
                            }
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/mainpage/', (route) => false);
                            // await showPopup(context, 'Email Verification link has been send to your email id. Please Verify','Email Verification');
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ),
                const Center(
                    child: Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFe68330)),
                )),
                Center(
                    child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login/', (route) => false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFe68330),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/views/changepass.dart';
import 'package:gdsc/views/loginview.dart';
import 'package:gdsc/views/quiz_page.dart';
import 'package:gdsc/views/registerview.dart';

import 'views/mainpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Map<int, Color> color = {
    50: Color.fromRGBO(231, 130, 48, .1),
    100: Color.fromRGBO(231, 130, 48, .2),
    200: Color.fromRGBO(231, 130, 48, .3),
    300: Color.fromRGBO(231, 130, 48, .4),
    400: Color.fromRGBO(231, 130, 48, .5),
    500: Color.fromRGBO(231, 130, 48, .6),
    600: Color.fromRGBO(231, 130, 48, .7),
    700: Color.fromRGBO(231, 130, 48, .8),
    800: Color.fromRGBO(231, 130, 48, .9),
    900: Color.fromRGBO(231, 130, 48, 1),
  };
  MaterialColor primary = MaterialColor(0xFFe78230, color);

  runApp(MaterialApp(
    title: 'Quiz App',
    theme: ThemeData(
      primarySwatch: primary,
    ),
    home: const HomePage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
      '/mainpage/': (context) => const MainPage(),
      '/changepass/': ((context) => const Changepassword()),
      
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: ((context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  final user = FirebaseAuth.instance.currentUser;
                  if (user == null) {
                    return const LoginView();
                  } else {
                    return const MainPage();
                  }

                default:
                  return const CircularProgressIndicator();
              }
            })));
  }
}

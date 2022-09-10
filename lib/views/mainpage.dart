import 'package:flutter/material.dart';
import 'package:gdsc/components/quiztopics.dart';
import 'package:gdsc/views/popup.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

enum MenuAction { logout }

int question_count = 30, yourRanking = 000;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        leading: const Icon(Icons.menu_rounded, size: 40),
        backgroundColor: const Color(0xFF2d4159),
        toolbarHeight: 150.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Quiz App',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_rounded),
            iconSize: 40,
            onPressed: (() {
              showLogoutPop(context);
            }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: 80,
                width: width - 20,
                decoration: const BoxDecoration(
                    color: Color(0xFFe68330),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Question Count',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              question_count.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 2,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Your Ranking',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            yourRanking.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 40),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: const [
                  quiztopic(name: 'Art and Literature'),
                  quiztopic(name: 'General Knowledge'),
                  quiztopic(name: 'Science'),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF252b3f),
    );
  }
}

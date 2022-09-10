import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc/views/Questions.dart';
import 'package:gdsc/views/timer.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.name});
  final name;

  @override
  State<QuizPage> createState() => _quizPageState();
}

class _quizPageState extends State<QuizPage> {
  var endTime;
  List question = [];
  var startTime;
  @override
  void initState() {
    startTime = DateTime.now();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    endTime = DateTime.now();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 40,
        backgroundColor: Color(0xFF2d4159),
        title: Text(widget.name),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('quiz')
            .doc(widget.name)
            .get(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var a = snapshot.data?.data();
            question.clear();
            for (int i = 0; i < a!.length; i++) {
              question.add(a[i.toString()]);
            }
            print(question);
            question.shuffle();
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Timer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: width - 20,
                    height: 2,
                    color: Colors.white,
                  ),
                ),
                Questions(question: question)
              ],
            ),
          );
        }),
      ),
      backgroundColor: Color(0xFF252b3f),
    );
  }
}

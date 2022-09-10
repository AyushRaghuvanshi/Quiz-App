import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/database/quizscores.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc/views/quizComp.dart';

class Questions extends StatefulWidget {
  Questions({super.key, required this.question});
  final List<dynamic> question;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Map? question;
  bool submit = false;
  int index = 0;
  late final startTime;
  var currTime;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  @override
  void initState() {
    // TODO: implement initState
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(index);
    question = widget.question[index];
    print(widget.question);
    double width = MediaQuery.of(context).size.width;
    // return Container();
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  question!['ques'],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selected1 = !selected1;
                            selected2 = false;
                            selected3 = false;
                            selected4 = false;
                          });
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                                color: selected1
                                    ? Color(0xFFe68330)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: width - 20,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: selected1
                                            ? Colors.white
                                            : Color(0xFFe68330),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: Center(
                                      child: Text(
                                        'A',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: selected1
                                                ? Color(0xFFe68330)
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Center(
                                    child: Text(
                                      question!['options'][0],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: selected1
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selected2 = !selected2;
                            selected1 = false;
                            selected3 = false;
                            selected4 = false;
                          });
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                                color: selected2
                                    ? Color(0xFFe68330)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: width - 20,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: selected2
                                            ? Colors.white
                                            : Color(0xFFe68330),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: Center(
                                      child: Text(
                                        'B',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: selected2
                                                ? Color(0xFFe68330)
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Center(
                                    child: Text(
                                      question!['options'][1],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: selected2
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selected3 = !selected3;
                            selected2 = false;
                            selected1 = false;
                            selected4 = false;
                          });
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                                color: selected3
                                    ? Color(0xFFe68330)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: width - 20,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: selected3
                                            ? Colors.white
                                            : Color(0xFFe68330),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: Center(
                                      child: Text(
                                        'C',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: selected3
                                                ? Color(0xFFe68330)
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Center(
                                    child: Text(
                                      question!['options'][2],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: selected3
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selected4 = !selected4;
                            selected2 = false;
                            selected3 = false;
                            selected1 = false;
                          });
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                                color: selected4
                                    ? Color(0xFFe68330)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: width - 20,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: selected4
                                            ? Colors.white
                                            : Color(0xFFe68330),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200))),
                                    child: Center(
                                      child: Text(
                                        'D',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: selected4
                                                ? Color(0xFFe68330)
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Center(
                                          child: Text(
                                            question!['options'][3],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: selected4
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          if (submit) {
                            submitscore();
                          }
                          setState(() {
                            if (index == 0) {
                              index = widget.question.length - 1;
                              submit = true;
                            } else {
                              int score = 0;
                              if (selected1) {
                                if (question!['options'][0] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              }
                              if (selected2) {
                                if (question!['options'][1] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              }
                              if (selected3) {
                                if (question!['options'][2] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              }
                              if (selected4) {
                                if (question!['options'][3] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              }

                              setscore(index, score);

                              submit = false;
                              index--;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFe68330),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: ((width - 20) / 2) - 60,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Center(
                                  child: Text(
                                    'Previous',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                      child: OutlinedButton(
                          onPressed: () {
                            if (submit) {
                              submitscore();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizComp()),
                              );
                            }
                            if (index == widget.question.length - 1) {
                              setState(() {
                                submit = true;
                              });
                            } else {
                              int score = 0;
                              if (selected1) {
                                if (question!['options'][0] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              } else if (selected2) {
                                if (question!['options'][1] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              } else if (selected3) {
                                if (question!['options'][2] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              } else if (selected4) {
                                if (question!['options'][3] ==
                                    question!['ans']) {
                                  score = 1;
                                } else {
                                  score = -1;
                                }
                              } else {
                                score = 0;
                              }

                              setscore(index, score);

                              setState(() {
                                submit = false;
                                index++;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFe68330),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: ((width - 20) / 2) - 60,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Center(
                                    child: Text(
                                      submit ? 'Submit' : 'Next',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

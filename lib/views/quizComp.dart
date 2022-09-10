import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc/database/quizscores.dart';
import 'package:gdsc/views/timer.dart';

class QuizComp extends StatefulWidget {
  const QuizComp({super.key});

  @override
  State<QuizComp> createState() => _QuizCompState();
}

class _QuizCompState extends State<QuizComp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool pass = (a[1] >= 4) ? true : false;
    return Scaffold(
      backgroundColor: Color(0xFF252b3f),
      body: Center(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.network(
                  (pass)
                      ? 'https://cdn.dribbble.com/users/416805/screenshots/3045269/dribbble-congrats.png'
                      : 'https://cdn.shopify.com/s/files/1/1061/1924/products/Sad_Face_Emoji_large.png?v=1571606037',
                  height: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                pass ? 'Congrats!' : 'Alas!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              '${a[1]}0% Score',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: pass ? Colors.green : Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Quiz Completed Successfully',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'You attempted ${10 - a[0]} questions and from that ${a[1]} questions are correct in ${time} minutes',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        width: width - 80,
        height: height - 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      )),
    );
  }
}

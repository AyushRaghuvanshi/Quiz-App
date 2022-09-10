import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gdsc/views/quiz_page.dart';

class quiztopic extends StatefulWidget {
  const quiztopic({super.key, required this.name});
  final String name;
  @override
  State<quiztopic> createState() => _quiztopicState();
}

class _quiztopicState extends State<quiztopic> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding:  const EdgeInsets.only(top: 20),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  QuizPage(name: widget.name)),
          );
        },
        child: Container(
          height: 80,
          width: width + 20,
          decoration: const BoxDecoration(
              color: Color(0xFF30455d),
              borderRadius: (BorderRadius.all(Radius.circular(5)))),
          child: Center(
            child: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

String time = '';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  var startTime, endTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          Stream<int>.periodic(const Duration(seconds: 1), (count) => count),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        var a = snapshot.data;
        int min = (a! / 60).floor();
        int seconds = a - (min * 60);
        time = '$min:$seconds';
        return Text(
          '$min:$seconds',
          style: TextStyle(color: Colors.white, fontSize: 30),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text(
          "Match Photo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 2;
  int rightImageNumber = 1;

  void changeImageNumber() {
    rightImageNumber = Random().nextInt(8) + 1;
    leftImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          rightImageNumber == leftImageNumber
              ? "You have succeeded"
              : "Try again",
          style: const TextStyle(
            fontSize: 32.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                //flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeImageNumber();
                    });
                  },
                  child: Image.asset("images/image-$leftImageNumber.png"),
                ),
              ),
              Expanded(
                //flex: 1,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeImageNumber();
                      });
                    },
                    child: Image.asset("images/image-$rightImageNumber.png")),
              ),
            ],
          ),
        )
      ],
    );
  }
}

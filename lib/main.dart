import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:confetti/confetti.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool enabled = true;
  ConfettiController confettiController =
      ConfettiController(duration: Duration(milliseconds: 100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kushal'),
      ),
      body: Stack(
        children: [
          Center(
            child: ConfettiWidget(
              numberOfParticles: 50,
              colors: [Colors.yellow, Colors.red],
              blastDirectionality: BlastDirectionality.explosive,
              confettiController: confettiController,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                confettiController.play();
              },
              child: Shimmer.fromColors(
                enabled: enabled,
                baseColor: Colors.yellow,
                highlightColor: Colors.red,
                child: Text(
                  'KG',
                  style: TextStyle(
                    fontSize: 180,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
            ),
          ),

          //   Center(
          //     child: Container(color: Colors.red, height: 100.0, width: 100.0),
          //   ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          enabled ? Icons.pause : Icons.play_arrow,
        ),
        onPressed: () {
          setState(() {
            enabled = !enabled;
          });
        },
      ),
    );
  }
}

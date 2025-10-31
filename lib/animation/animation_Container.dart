import 'package:animation/steper/ui/steper.dart';
import 'package:animation/animation/timer.dart';
import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  const AnimationContainer({super.key});

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  bool isExpanded = false;
  bool isExpandedOpacity = true;
  bool isAlign = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimerCountView()),
              );
            },
            icon: Icon(Icons.timer),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: isExpanded ? 300 : 120,
                height: isExpanded ? 300 : 120,
                color: isExpanded ? Colors.red : Colors.blue,
                child: Center(child: Text('Hello')),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpandedOpacity = !isExpandedOpacity;
                });
              },
              child: AnimatedOpacity(
                opacity: isExpandedOpacity ? 1.0 : 0,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                  child: Center(child: Text("text")),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAlign = !isAlign;
                });
              },
              child: AnimatedAlign(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                alignment: isAlign
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Icon(Icons.ac_unit, color: Colors.white, size: 50),
                  ),
                ),
              ),
            ),
          ),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SteperWidget()));
          }, child: Text("Steppere")),
        ],
      ),
    );
  }
}

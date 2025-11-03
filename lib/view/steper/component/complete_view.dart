import 'package:flutter/material.dart';

class CompleteView extends StatefulWidget {
  const CompleteView({super.key});

  @override
  State<CompleteView> createState() => _CompleteViewState();
}

class _CompleteViewState extends State<CompleteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Column(children: [Text("Welcome")])),
    );
  }
}

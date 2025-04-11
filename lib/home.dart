import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? number;

  const HomePage({Key? key, this.number}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("سلام کاربر"), Text("${widget.number}")],
        ),
      ),
    );
  }
}

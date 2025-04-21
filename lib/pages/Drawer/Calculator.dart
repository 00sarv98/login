import 'package:flutter/material.dart';

Widget but(String name, {int fl = 1}) {
  return Expanded(
    flex: fl,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: Colors.deepOrange,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  );
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 20, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("ماشین حساب", style: TextStyle(fontSize: 24)),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text("0", style: TextStyle(fontSize: 35.0)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      but("/"),
                      but("1"),
                      but("4"),
                      but("7"),
                      but("ac"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      but("()"),
                      but("2"),
                      but("5"),
                      but("8"),
                      but("0"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      but("*"),
                      but("3"),
                      but("6"),
                      but("9"),
                      but("."),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [but("-"), but("+", fl: 2), but("=", fl: 2)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

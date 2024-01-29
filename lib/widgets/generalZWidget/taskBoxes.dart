import 'package:flutter/material.dart';

class PriorTaskBoxes extends StatelessWidget {
  PriorTaskBoxes({super.key, required this.task});
  String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 11, right: 11, top: 6, bottom: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(
            19,
            19,
            19,
            .5,
          )),
      child: Text(
        task,
        style: const TextStyle(
            fontFamily: "Satoshi",
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class SecondPriorTaskBoxes extends StatelessWidget {
  SecondPriorTaskBoxes({super.key, required this.task});
  String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(
            19,
            19,
            19,
            .5,
          )),
      child: Text(
        task,
        style: const TextStyle(
            fontFamily: "Satoshi",
            color: Colors.white,
            fontSize: 7.62,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

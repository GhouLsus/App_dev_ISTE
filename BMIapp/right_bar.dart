import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  final double barWidth;

  const RightBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
        )
      ],
    );
  }
}
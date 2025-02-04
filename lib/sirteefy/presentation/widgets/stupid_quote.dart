import 'package:flutter/material.dart';


class StupidQuote extends StatelessWidget {
  const StupidQuote({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size.width * 0.5,
          height: 50,
          color: Colors.blue,
        ),
        Positioned(
          right: 0,
          bottom: -50,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.20,
            ),
            width: size.width * 0.15,
            height: 50,
            color: Colors.red,

          ),
        )
      ],
    );
  }
}

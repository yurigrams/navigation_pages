import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.green
            ],
        ),
      ),
      child: Image.network('https://cdn-icons-png.flaticon.com/128/4946/4946345.png',),
    );
  }
}

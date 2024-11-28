import 'package:flutter/material.dart';

class OtherMatches extends StatelessWidget {
  const OtherMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          child: Center(child: Text('No Other Matches')),
        ),
      ],
    );
  }
}

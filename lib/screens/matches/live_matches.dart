import 'package:flutter/material.dart';

class LiveMatches extends StatelessWidget {
  const LiveMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Center(child: Text('No Live Matches')),
          ),
        ],
      ),
    );
  }
}
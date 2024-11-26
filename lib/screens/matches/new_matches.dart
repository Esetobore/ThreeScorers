import 'package:flutter/material.dart';

class NewMatches extends StatelessWidget {
  const NewMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Center(child: Text('No New Matches')),
          ),
        ],
      ),
    );
  }
}

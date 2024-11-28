import 'package:flutter/material.dart';
import 'package:threescorersassessment/widgets/match_card.dart';

class PostMatches extends StatelessWidget {
  const PostMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MatchCard(),
      ],
    );
  }
}

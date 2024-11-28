import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/asset_path.dart';

class MatchResult extends StatelessWidget {
  const MatchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barcelona Team
              const Teams(
                  teamName: 'Barcelona',
                  player1: 'Messi',
                  player2: 'Suarez',
                  player3: 'Neymar',
                  logo: AssetsPath.barcelona),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '3 - 3',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '(4 - 2)',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Penalty',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const Teams(
                  teamName: 'Girona',
                  player1: 'Couto',
                  player2: 'Garcia',
                  player3: 'Martin',
                  logo: AssetsPath.girona)
            ],
          ),
        ),
      ],
    );
  }
}

class Teams extends StatelessWidget {
  const Teams(
      {super.key,
      required this.teamName,
      required this.player1,
      required this.player2,
      required this.player3,
      required this.logo});

  final String teamName;
  final String player1;
  final String player2;
  final String player3;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          child: Image.asset(logo, height: 60, width: 60),
        ),
        const SizedBox(height: 8.0),
        Text(
          teamName,
          style: const TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$player1\n$player2\n$player3',
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

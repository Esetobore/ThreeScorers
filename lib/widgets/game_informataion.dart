import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/asset_path.dart';
import 'package:threescorersassessment/data_model/game_information.dart';
import 'package:threescorersassessment/service/match_details_service.dart';

class GameInformation extends StatefulWidget {
  const GameInformation({super.key});

  @override
  State<GameInformation> createState() => _GameInformation();
}

class _GameInformation extends State<GameInformation> {
  late Future<GameInformationModel> _gameInformationFuture;

  @override
  void initState() {
    super.initState();
    _gameInformationFuture = MatchDetailsService().fetchGameInformation();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GameInformationModel>(
      future: _gameInformationFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text(''));
        }
        final player = snapshot.data!;
        return _buildPlayerCard(player);
      },
    );
  }

  Widget _buildPlayerCard(GameInformationModel game) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.teal,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: const Text(
              'Game Information',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Info(
                  title: 'Venue',
                  response: game.venue,
                  icon: AssetsPath.venue,
                ),
                const SizedBox(height: 10),
                Info(
                  title: 'City',
                  response: game.city,
                  icon: AssetsPath.venue,
                ),
                const SizedBox(height: 10),
                Info(
                  title: 'Referee',
                  response: game.referee,
                  icon: AssetsPath.referee,
                ),
                const SizedBox(height: 10),
                Info(
                  title: 'Stadium',
                  response: game.stadiumCapacity.toString(),
                  icon: AssetsPath.stadium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.response,
    required this.icon,
  });

  final String title;
  final String response;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(icon, height: 25, width: 25),
            const SizedBox(
              width: 20,
            ),
            Text(title),
          ],
        ),
        Text(
          response,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

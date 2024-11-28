import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/colors.dart';

import '../constants/asset_path.dart';

class LeagueIconRow extends StatefulWidget {
  const LeagueIconRow({super.key});

  @override
  State<LeagueIconRow> createState() => _LeagueIconRowState();
}

class _LeagueIconRowState extends State<LeagueIconRow> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildGestureDetector(index: 0, text: 'All', image: AssetsPath.all),
        buildGestureDetector(index: 1, text: 'EPL', image: AssetsPath.epl),
        buildGestureDetector(
            index: 2, text: 'La Liga', image: AssetsPath.laLiga),
        buildGestureDetector(
            index: 3, text: 'Serie A', image: AssetsPath.serieA),
        buildGestureDetector(
            index: 4, text: 'Bundesliga', image: AssetsPath.bundesliga),
        buildGestureDetector(
            index: 5, text: 'Ligue 1', image: AssetsPath.ligue1),
      ],
    );
  }

  GestureDetector buildGestureDetector(
      {required int index, required String text, required String image}) {
    return GestureDetector(
      onTap: () => _updateSelectedIndex(index),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _selectedIndex == index ? AppColors.onClicked : Colors.black,
            ),
            child: Center(
              child: Image.asset(image, height: 30, width: 30),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

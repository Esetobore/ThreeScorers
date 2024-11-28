import 'package:flutter/material.dart';
import 'package:threescorersassessment/screens/match_details/lineups.dart';
import 'package:threescorersassessment/screens/match_details/other_matches.dart';
import 'package:threescorersassessment/screens/match_details/statistics.dart';
import 'package:threescorersassessment/widgets/matches_details_tab_bar.dart';

import '../screens/match_details/overview.dart';

class MatchesDetailsIndex extends StatefulWidget {
  const MatchesDetailsIndex({super.key});

  @override
  State<MatchesDetailsIndex> createState() => _MatchesDetailsIndex();
}

class _MatchesDetailsIndex extends State<MatchesDetailsIndex> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatchesDetailsTabBar(
          selectedIndex: selectedTabIndex,
          onTabChanged: (index) {
            setState(() {
              selectedTabIndex = index;
            });
          },
        ),
        // Content based on selected tab
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildSelectedView(),
        ),
      ],
    );
  }

  Widget _buildSelectedView() {
    switch (selectedTabIndex) {
      case 0:
        return const Overview();
      case 1:
        return const Lineups();
      case 2:
        return const Statistics();
      case 3:
        return const OtherMatches();
      default:
        return const SizedBox.shrink();
    }
  }
}

// Custom Tab Bar Widget`

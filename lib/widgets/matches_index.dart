import 'package:flutter/material.dart';
import 'package:threescorersassessment/screens/matches/live_matches.dart';
import 'package:threescorersassessment/screens/matches/new_matches.dart';
import 'package:threescorersassessment/screens/matches/post_matches.dart';
import 'package:threescorersassessment/widgets/matches_tab_bar.dart';

class MatchesIndex extends StatefulWidget {
  const MatchesIndex({super.key});

  @override
  State<MatchesIndex> createState() => _MatchesIndexState();
}

class _MatchesIndexState extends State<MatchesIndex> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatchesTabBar(
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
        return const LiveMatches();
      case 1:
        return const NewMatches();
      case 2:
        return const PostMatches();
      default:
        return const SizedBox.shrink();
    }
  }
}

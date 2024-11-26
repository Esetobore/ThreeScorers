import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/colors.dart';

class MatchesTabBar extends StatelessWidget {
  final Function(int) onTabChanged;
  final int selectedIndex;

  const MatchesTabBar({
    super.key,
    required this.onTabChanged,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.matchesVar,
          child: Row(
            children: [
              _buildTab(context, 'Live Matches', 0),
              _buildTab(context, 'New Matches', 1),
              _buildTab(context, 'Post Matches', 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String title, int index) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Container(
              height: 5,
              width: 100,
              color: isSelected ? AppColors.onClicked : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

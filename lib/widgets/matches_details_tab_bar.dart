import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/colors.dart';

class MatchesDetailsTabBar extends StatelessWidget {
  final Function(int) onTabChanged;
  final int selectedIndex;

  const MatchesDetailsTabBar({
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
              _buildTab(context, 'Overview', 0),
              _buildTab(context, 'Line-Up', 1),
              _buildTab(context, 'Statistics', 2),
              _buildTab(context, 'Matches', 3),
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
import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/asset_path.dart';
import 'package:threescorersassessment/widgets/custom_navigation_bar.dart';
import 'package:threescorersassessment/widgets/match_result_widget.dart';
import 'package:threescorersassessment/widgets/matches_details_index.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 1),
      body: SafeArea(
        child: Column(
          children: [
            // Header section with image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsPath.detailHeader),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Match Details",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const MatchResult(),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Scrollable content section
            const Expanded(
              child: SingleChildScrollView(
                child: MatchesDetailsIndex(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

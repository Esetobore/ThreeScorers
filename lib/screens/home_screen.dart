import 'package:flutter/material.dart';
import 'package:threescorersassessment/widgets/custom_navigation_bar.dart';
import 'package:threescorersassessment/widgets/matches_index.dart';

import '../constants/asset_path.dart';
import '../widgets/league_icon_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(currentIndex: 0),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.homeHeader),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Image.asset(AssetsPath.appLogo, height: 50, width: 50),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const LeagueIconRow(),
                  const SizedBox(height: 20),
                ]),
              ),
              const MatchesIndex(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:threescorersassessment/constants/endpoints.dart';
import 'package:threescorersassessment/data_model/best_player.dart';
import 'package:threescorersassessment/data_model/game_information.dart';
import 'package:threescorersassessment/data_model/match_incident.dart';
import 'package:threescorersassessment/data_model/match_momentum.dart';
import 'package:threescorersassessment/data_model/video_highlight.dart';

class MatchDetailsService {
  Future<List<VideoHighlight>> fetchVideoHighlights() async {
    try {
      final response = await http.get(Uri.parse(Endpoints.videoHighlightUrl));

      if (response.statusCode == 200) {
        dynamic jsonBody = json.decode(response.body);
        if (jsonBody is Map<String, dynamic>) {
          if (jsonBody.containsKey('data')) {
            jsonBody = jsonBody['data'];
          }
        }
        List<dynamic> jsonList = jsonBody is List ? jsonBody : [jsonBody];
        return jsonList.map((json) => VideoHighlight.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load video highlights');
      }
    } catch (e) {
      throw Exception('Error fetching video highlights: $e');
    }
  }

  Future<BestPlayer> fetchBestPlayer() async {
    try {
      final response = await http.get(Uri.parse(Endpoints.bestPlayerUrl));
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        return BestPlayer.fromJson(jsonBody);
      } else {
        throw Exception('Failed to load best player');
      }
    } catch (e) {
      throw Exception('Error fetching best player: $e');
    }
  }

  Future<GameInformationModel> fetchGameInformation() async {
    try {
      final response = await http.get(Uri.parse(Endpoints.gameInformation));
      if (response.statusCode == 200) {
        return GameInformationModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load match details');
      }
    } catch (e) {
      throw Exception('Error fetching match details: $e');
    }
  }

  Future<List<MatchMomentumModel>> fetchMatchMomentum() async {
    final response = await http.get(Uri.parse(Endpoints.matchMomentum));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final allPeriodStats = data['data']['statistics'][0]; // ALL period stats

      final ballPossession = allPeriodStats['groups'][0]['statisticsItems']
          .firstWhere((item) => item['key'] == 'ballPossession');

      return [
        MatchMomentumModel(
            teamName: 'Home Team',
            possession: double.parse(ballPossession['homeValue'].toString()),
            color: Colors.blue),
        MatchMomentumModel(
            teamName: 'Away Team',
            possession: double.parse(ballPossession['awayValue'].toString()),
            color: Colors.red)
      ];
    } else {
      throw Exception('Failed to load match stats');
    }
  }

  Future<List<MatchIncident>> fetchIncidents() async {
    final response = await http.get(Uri.parse(Endpoints.incidents));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> incidentsJson = jsonResponse['data']['incidents'];
      return incidentsJson
          .map((json) => MatchIncident.fromJson(json))
          .toList()
          .reversed
          .toList(); // Reverse to show from start to end
    } else {
      throw Exception('Failed to load incidents');
    }
  }
}

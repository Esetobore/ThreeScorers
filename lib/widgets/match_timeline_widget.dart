import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/asset_path.dart';
import 'package:threescorersassessment/data_model/match_incident.dart';
import 'package:threescorersassessment/service/match_details_service.dart';

class MatchTimelineWidget extends StatefulWidget {
  const MatchTimelineWidget({super.key});

  @override
  State<MatchTimelineWidget> createState() => _MatchTimelineWidgetState();
}

class _MatchTimelineWidgetState extends State<MatchTimelineWidget> {
  late Future<List<MatchIncident>> _incidentsFuture;

  @override
  void initState() {
    super.initState();
    _incidentsFuture = MatchDetailsService().fetchIncidents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MatchIncident>>(
      future: _incidentsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center();
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No incidents found'));
        }

        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.teal,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsPath.barcelona, height: 20, width: 20),
                  const Text(
                    'Match Current Stats',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(AssetsPath.girona, height: 20, width: 20),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              margin: const EdgeInsets.symmetric(),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final incident = snapshot.data![index];
                    return _buildTimelineIncident(incident);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimelineIncident(MatchIncident incident) {
// Handle different incident types with appropriate icons and styling
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!incident.isHome) ...[
            _buildIncidentContent(incident, isHome: false),
          ],
          Text(
            '${incident.time ?? ''}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          if (incident.isHome) ...[
            _buildIncidentContent(incident, isHome: true),
          ]
        ],
      ),
    );
  }

  Widget _buildIncidentContent(MatchIncident incident, {required bool isHome}) {
    String icon;

    switch (incident.incidentType) {
      case 'substitution':
        icon = AssetsPath.swap;
        break;
      case 'goal':
        icon = AssetsPath.goal;
        break;
      case 'card':
        icon = incident.description == 'yellow'
            ? AssetsPath.yellowCard
            : AssetsPath.redCard;
        break;
      default:
        icon = AssetsPath.play;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          icon,
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 8),
        Text(
          incident.playerName ?? incident.incidentType,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:threescorersassessment/constants/asset_path.dart';
import 'package:threescorersassessment/data_model/video_highlight.dart';
import 'package:threescorersassessment/service/match_details_service.dart';

class VideoHighlightsWidget extends StatefulWidget {
  const VideoHighlightsWidget({super.key});

  @override
  State<VideoHighlightsWidget> createState() => _VideoHighlightsWidgetState();
}

class _VideoHighlightsWidgetState extends State<VideoHighlightsWidget> {
  late Future<List<VideoHighlight>> _videoHighlightsFuture;

  @override
  void initState() {
    super.initState();
    _videoHighlightsFuture = MatchDetailsService().fetchVideoHighlights();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideoHighlight>>(
      future: _videoHighlightsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No video highlights found'));
        }
        return Column(
          children: snapshot.data!
              .map((highlight) => _buildHighlightCard(highlight))
              .toList(),
        );
      },
    );
  }

  Widget _buildHighlightCard(VideoHighlight highlight) {
    return SizedBox(
      height: 200,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Stack(
              alignment: Alignment.topRight,
              children: [
                highlight.thumbnailUrl.isNotEmpty
                    ? Image.network(highlight.thumbnailUrl,
                        fit: BoxFit.cover, width: double.infinity, height: 110)
                    : Image.asset(AssetsPath.homeHeader,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.fitWidth),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Watch Highlight',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

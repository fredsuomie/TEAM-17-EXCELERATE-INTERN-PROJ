import 'package:flutter/material.dart';
import '../services/progress_service.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = ProgressService.programScores.entries.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Progress Overview')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: entries.isEmpty
            ? _emptyState()
            : ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final programId = entries[index].key;
            final progress =
            ProgressService.getProgress(programId);

            return _progressCard(programId, progress);
          },
        ),
      ),
    );
  }

  Widget _progressCard(String programId, int progress) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              programId,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress / 100,
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            Text('Confidence: $progress%'),
            const SizedBox(height: 8),
            Text(_feedbackText(progress)),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Text(
        'No assessments completed yet.\nStart a self-assessment to see progress!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  String _feedbackText(int progress) {
    if (progress >= 80) {
      return 'Excellent confidence! You are mastering this program.';
    } else if (progress >= 50) {
      return 'Good progress. Keep practicing advanced topics.';
    } else {
      return 'You are just getting started. Stay consistent!';
    }
  }
}

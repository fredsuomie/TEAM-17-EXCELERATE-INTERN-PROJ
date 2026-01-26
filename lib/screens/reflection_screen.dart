import 'package:flutter/material.dart';
import '../models/program.dart';
import 'progress_screen.dart';

class ReflectionScreen extends StatefulWidget {
  final Program program;
  final String confidence;

  const ReflectionScreen({
    super.key,
    required this.program,
    required this.confidence,
  });

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  final _understoodController = TextEditingController();
  final _improveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reflection')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Feedback',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(_feedbackText(widget.confidence)),
            const SizedBox(height: 24),

            TextField(
              controller: _understoodController,
              decoration: const InputDecoration(
                labelText: 'What did you understand well?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _improveController,
              decoration: const InputDecoration(
                labelText: 'What do you need to improve?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProgressScreen(),
                  ),
                );
              },
              child: const Text('Submit Reflection'),
            ),
          ],
        ),
      ),
    );
  }

  String _feedbackText(String confidence) {
    switch (confidence) {
      case 'Very Confident':
        return 'Great job! You show strong understanding.';
      case 'Somewhat Confident':
        return 'You are doing well but could benefit from revision.';
      case 'Neutral':
        return 'Consider revisiting key concepts.';
      default:
        return 'Focus on fundamentals and practice more.';
    }
  }
}

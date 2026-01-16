import 'package:flutter/material.dart';

class ProgramDetailScreen extends StatelessWidget {
  const ProgramDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Program Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// PROGRAM TITLE
            Text(
              'Flutter Basics',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            /// PROGRAM META
            Row(
              children: const [
                Icon(Icons.schedule, size: 18),
                SizedBox(width: 6),
                Text('Duration: 2 Weeks'),
                SizedBox(width: 16),
                Icon(Icons.bar_chart, size: 18),
                SizedBox(width: 6),
                Text('Level: Beginner'),
              ],
            ),

            const SizedBox(height: 24),

            /// DESCRIPTION
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This program introduces you to Flutter fundamentals including widgets, layouts, and basic state management.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            /// START BUTTON
            Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: TextButton(
                onPressed: () {
                  // Navigation to Self Assessment will be added later
                },
                child: const Text(
                  'Start Self Assessment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// NOTE
            Text(
              'You will answer a few questions to evaluate your understanding.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

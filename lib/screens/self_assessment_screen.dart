import 'package:flutter/material.dart';
import 'package:learnsphere/screens/reflection_screen.dart';


class SelfAssessmentScreen extends StatefulWidget {
  const SelfAssessmentScreen({super.key});

  @override
  State<SelfAssessmentScreen> createState() => _SelfAssessmentScreenState();
}

class _SelfAssessmentScreenState extends State<SelfAssessmentScreen> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    final options = [
      'Very Confident',
      'Somewhat Confident',
      'Neutral',
      'Not Confident',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Assessment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// QUESTION
            Text(
              'How confident are you with Flutter basics?',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            /// OPTIONS
            ...List.generate(options.length, (index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: RadioListTile<int>(
                  value: index,
                  groupValue: selectedOption,
                  title: Text(options[index]),
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              );
            }),

            const Spacer(),

            /// SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: selectedOption == -1
                    ? null
                    : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ReflectionScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Submit Assessment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/progress_service.dart';
import 'reflection_screen.dart';

class SelfAssessmentScreen extends StatefulWidget {
  final Program program;
  const SelfAssessmentScreen({super.key, required this.program});

  @override
  State<SelfAssessmentScreen> createState() => _SelfAssessmentScreenState();
}

class _SelfAssessmentScreenState extends State<SelfAssessmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedConfidence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Self Assessment')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How confident are you with ${widget.program.title}?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),

                _option('Very Confident'),
                _option('Somewhat Confident'),
                _option('Neutral'),
                _option('Not Confident'),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    if (selectedConfidence == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a confidence level'),
                        ),
                      );
                      return;
                    }

                    ProgressService.addScore(
                      widget.program.id,
                      selectedConfidence!,
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReflectionScreen(
                          program: widget.program,
                          confidence: selectedConfidence!,
                        ),
                      ),
                    );
                  },
                  child: const Text('Submit Assessment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _option(String value) {
    return RadioListTile<String>(
      value: value,
      groupValue: selectedConfidence,
      title: Text(value),
      onChanged: (val) {
        setState(() {
          selectedConfidence = val;
        });
      },
    );
  }
}

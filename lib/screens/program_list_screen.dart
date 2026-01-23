import 'package:flutter/material.dart';
import 'package:learnsphere/screens/program_detail_screen.dart';


class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programs = [
      {
        'title': 'Flutter Basics',
        'desc': 'Understand widgets, layouts, and state',
        'icon': Icons.phone_android,
      },
      {
        'title': 'Data Structures',
        'desc': 'Learn arrays, stacks, and queues',
        'icon': Icons.storage,
      },
      {
        'title': 'Cloud Fundamentals',
        'desc': 'Introduction to cloud computing',
        'icon': Icons.cloud_outlined,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 26,
                backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.15),
                child: Icon(
                  program['icon'] as IconData,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(
                program['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(program['desc'] as String),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProgramDetailScreen(),
                  ),
                );
              },
              // Navigation to Program Detail will be added later
            ),
          );
        },
      ),
    );
  }
}

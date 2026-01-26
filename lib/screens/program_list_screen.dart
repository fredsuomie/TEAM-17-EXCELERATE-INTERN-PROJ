import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/program_service.dart';
import 'program_detail_screen.dart';

class ProgramListScreen extends StatelessWidget {
  const ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programs')),
      body: FutureBuilder<List<Program>>(
        future: ProgramService.fetchPrograms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load programs'));
          }

          final programs = snapshot.data!;
          if (programs.isEmpty) {
            return const Center(child: Text('No programs available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              return Card(
                child: ListTile(
                  title: Text(program.title),
                  subtitle: Text(program.level),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProgramDetailScreen(program: program),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

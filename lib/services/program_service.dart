import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class ProgramService {
  static Future<List<Program>> fetchPrograms() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API

    final jsonString =
    await rootBundle.loadString('assets/data/programs.json');

    final List data = json.decode(jsonString);

    return data.map((e) => Program.fromJson(e)).toList();
  }
}

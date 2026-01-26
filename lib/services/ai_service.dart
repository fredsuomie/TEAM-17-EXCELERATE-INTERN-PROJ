import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static Future<String> generateQuestion(String programTitle) async {
    final apiKey = dotenv.env['OPENAI_API_KEY'];

    // Fallback if API key is missing
    if (apiKey == null || apiKey.isEmpty) {
      return "How confident are you with $programTitle?";
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content":
              "You generate short self-assessment questions for students."
            },
            {
              "role": "user",
              "content":
              "Generate one short confidence-based self-assessment question for $programTitle."
            }
          ],
          "max_tokens": 40,
          "temperature": 0.5
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        return "How confident are you with $programTitle?";
      }
    } catch (e) {
      return "How confident are you with $programTitle?";
    }
  }

  static Future<String> generateFeedback({
    required String programTitle,
    required String confidence,
  }) async {
    final apiKey = dotenv.env['OPENAI_API_KEY'];

    // Fallback feedback
    if (apiKey == null || apiKey.isEmpty) {
      return _fallbackFeedback(programTitle, confidence);
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content":
              "You provide short, supportive learning feedback for students."
            },
            {
              "role": "user",
              "content":
              "The student selected '$confidence' for $programTitle. Give short learning advice."
            }
          ],
          "max_tokens": 60,
          "temperature": 0.5
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        return _fallbackFeedback(programTitle, confidence);
      }
    } catch (_) {
      return _fallbackFeedback(programTitle, confidence);
    }
  }

// Local rule-based fallback (VERY IMPORTANT)
  static String _fallbackFeedback(String program, String confidence) {
    switch (confidence) {
      case 'Very Confident':
        return 'Great work! You seem ready to move on to more advanced $program topics.';
      case 'Somewhat Confident':
        return 'You have a good start, but revisiting some $program concepts could help.';
      case 'Neutral':
        return 'Consider reviewing key $program areas to strengthen your understanding.';
      case 'Not Confident':
        return 'It’s recommended to revisit the basics of $program and practice more.';
      default:
        return 'Keep learning and practicing $program!';
    }
  }

}

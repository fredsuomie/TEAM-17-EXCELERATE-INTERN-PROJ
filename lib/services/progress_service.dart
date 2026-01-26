class ProgressService {
  static final Map<String, List<int>> _programScores = {};

  static Map<String, List<int>> get programScores => _programScores;

  static void addScore(String programId, String confidence) {
    final score = _confidenceToScore(confidence);

    _programScores.putIfAbsent(programId, () => []);
    _programScores[programId]!.add(score);
  }

  static int getProgress(String programId) {
    final scores = _programScores[programId];
    if (scores == null || scores.isEmpty) return 0;

    final total = scores.reduce((a, b) => a + b);
    final maxPossible = scores.length * 4;

    return ((total / maxPossible) * 100).round();
  }

  static int _confidenceToScore(String confidence) {
    switch (confidence) {
      case 'Very Confident':
        return 4;
      case 'Somewhat Confident':
        return 3;
      case 'Neutral':
        return 2;
      case 'Not Confident':
        return 1;
      default:
        return 0;
    }
  }
}

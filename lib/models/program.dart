class Program {
  final String id;
  final String title;
  final String description;
  final String level;
  final String duration;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.duration,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      level: json['level'],
      duration: json['duration'],
    );
  }
}

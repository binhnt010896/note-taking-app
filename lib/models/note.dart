class Note {
  late final String title;
  late final String? brief;
  late final String? content;

  Note({required this.title, this.brief, this.content});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    title: json["title"] as String,
    brief: json["brief"] as String?,
    content: json["content"] as String?,
  );
}
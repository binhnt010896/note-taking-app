class Note {
  final String? id;
  final String title;
  final String? brief;
  final List? content;

  Note({this.id, required this.title, this.brief, this.content});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["id"] as String,
    title: json["title"] as String,
    brief: json["brief"] as String?,
    content: json["content"] as List?,
  );

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'brief': brief ?? '-',
      'content': content ?? []
    };
  }

  Note copyWith({ String? id, String? title, String? brief, List<dynamic>? content }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      brief: brief ?? this.brief,
      content: content ?? this.content,
    );
  }
}
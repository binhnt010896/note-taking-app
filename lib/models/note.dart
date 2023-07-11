class Note {
  final String? id;
  final String title;
  final String? userId;
  final String? brief;
  final List? content;
  final DateTime createdAt;

  Note({this.id, required this.title, this.userId, this.brief, this.content, required this.createdAt});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["id"] as String?,
    title: json["title"] ?? 'Untitled',
    brief: json["brief"] as String?,
    userId: json["user_id"] as String?,
    content: json["content"] ?? emptyContent,
    createdAt: DateTime.tryParse(json["created_at"] ?? '') ?? DateTime.now(),
  );

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'user_id': userId,
      'brief': brief ?? '-',
      'content': content ?? Note.emptyContent,
    };
  }

  Note copyWith({ String? id, String? title, String? brief, String? userId, List<dynamic>? content, DateTime? createdAt }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      brief: brief ?? this.brief,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static const emptyContent = [{'insert': '\n'}];
}
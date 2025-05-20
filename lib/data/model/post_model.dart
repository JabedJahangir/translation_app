class Post {
  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String> tags;
  final Map<String, dynamic> reactions;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
      tags: List<String>.from(json['tags']),
      reactions: Map<String, dynamic>.from(json['reactions']),
    );
  }
}

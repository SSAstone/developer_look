class FeedModel {
  final User user;
  final String time;
  final double rating;
  final List<String> tags;
  final String description;
  final int likes;
  final int comments;
  final List<String> images;
  final List<Comment> commentsList;

  FeedModel({
    required this.user,
    required this.time,
    required this.rating,
    required this.tags,
    required this.description,
    required this.likes,
    required this.comments,
    required this.images,
    required this.commentsList,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      user: User.fromJson(json['user']),
      time: json['time'],
      rating: (json['rating'] as num).toDouble(),
      tags: List<String>.from(json['tags']),
      description: json['description'],
      likes: json['likes'],
      comments: json['comments'],
      images: List<String>.from(json['images']),
      commentsList: (json['commentsList'] as List)
          .map((item) => Comment.fromJson(item))
          .toList(),
    );
  }
}

class User {
  final String name;
  final String image;

  User({required this.name, required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      image: json['image'],
    );
  }
}

class Comment {
  final User user;
  final String time;
  final int votes;
  final String comment;

  Comment({
    required this.user,
    required this.time,
    required this.votes,
    required this.comment,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      user: User.fromJson(json['user']),
      time: json['time'],
      votes: json['votes'],
      comment: json['comment'],
    );
  }
}

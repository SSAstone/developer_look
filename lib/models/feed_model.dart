class FeedModel {
  final String description, time, id;
  final double rating;
  final int likes, comments;
  final List<String> tags;
  final List<String> images;
  final User user;
  final List<Comments>? commentsList;


  FeedModel({
    required this.id,
    required this.description,
    required this.time,
    required this.user,
    required this.rating,
    required this.tags,
    required this.likes,
    required this.comments,
    required this.images,
    this.commentsList,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['id'] ?? '',
      time: json['time'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      user: User.fromJson(json['user']),
      rating: json['rating'],
      tags: List<String>.from(json['tags']),
      description: json['description'],
      likes: json['likes'],
      comments: json['comments'],
      commentsList: json['commentsList'] != null
          ? List<Comments>.from(
              json['commentsList'].map((c) => Comments.fromJson(c)),
            )
          : null,
    );
  }
}

class Comments {
  final String time, comment;
  final double votes;
  final User user;

  Comments({
    required this.user,
    required this.time,
    required this.votes ,
    required this.comment,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      user: User.fromJson(json['user']),
      time: json['time'],
      votes: json['votes']?.toDouble() ?? 0.0,
      comment: json['comment'],
    );
  }
}

class User {
  final String name, image, id;

  User({
    required this.name,
    required this.image,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'],
      image: json['image'],
    );
  }
}
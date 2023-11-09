class AdPost {
  final int id;
  final String date;
  final String category;
  final String dateGmt;
  final Title title;
  final int author;
  final String desc;
  late String? imageUrl;

  AdPost({
    required this.id,
    required this.date,
    required this.category,
    required this.dateGmt,
    required this.title,
    required this.author,
    required this.desc, 
    this.imageUrl,
  });

  factory AdPost.fromJson(Map<String, dynamic> json) {
    return AdPost(
      id: json['id'],
      date: json['date'],
      category: 'undefined',
      dateGmt: json['date_gmt'],
      title: Title.fromJson(json['title']),
      author: json['author'],
      desc: json['content']['rendered'],
    );
  }

  AdPost copyWith({
    int? id,
    String? date,
    String? category,
    String? dateGmt,
    Title? title,
    int? author,
    String? desc,
    String? imageUrl,
  }) {
    return AdPost(
      id: id ?? this.id,
      date: date ?? this.date,
      category: category ?? this.category,
      dateGmt: dateGmt ?? this.dateGmt,
      title: title ?? this.title,
      author: author ?? this.author,
      desc: desc ?? this.desc,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }


  @override
  String toString() {
    return 'AdPost(id: $id, date: $date, dateGmt: $dateGmt, desc: $desc, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AdPost other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.dateGmt == dateGmt &&
        other.title == title &&
        other.desc == desc &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        dateGmt.hashCode ^
        title.hashCode ^
        author.hashCode ^
        desc.hashCode ^
        imageUrl.hashCode;
  }
}

class Title {
  final String rendered;

  Title({required this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      rendered: json['rendered'],
    );
  }
}

class Content {
  final String rendered;
  final bool protected;

  Content({required this.rendered, required this.protected});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      rendered: json['rendered'],
      protected: json['protected'],
    );
  }
}

class Links {
  final String href;

  Links({required this.href});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      href: json['href'],
    );
  }
}

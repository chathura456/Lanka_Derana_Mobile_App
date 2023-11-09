import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String name;
  final String description;
  final String slug;
  final List<String> avatarUrls;
  final bool isSuperAdmin;

  User({
    required this.id,
    required this.name,
    required this.description,
    required this.slug,
    required this.avatarUrls,
    required this.isSuperAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Extract avatar URLs from the avatar_urls map
    List<String> avatarUrls = [];
    json['avatar_urls'].forEach((key, value) {
      avatarUrls.add(value);
    });

    return User(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      slug: json['slug'],
      avatarUrls: avatarUrls,
      isSuperAdmin: json['is_super_admin'],
    );
  }


  User copyWith({
    int? id,
    String? name,
    String? description,
    String? slug,
    List<String>? avatarUrls,
    bool? isSuperAdmin,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      slug: slug ?? this.slug,
      avatarUrls: avatarUrls ?? this.avatarUrls,
      isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'slug': slug,
      'avatarUrls': avatarUrls,
      'isSuperAdmin': isSuperAdmin,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, description: $description, slug: $slug, avatarUrls: $avatarUrls, isSuperAdmin: $isSuperAdmin)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.slug == slug &&
      listEquals(other.avatarUrls, avatarUrls) &&
      other.isSuperAdmin == isSuperAdmin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      slug.hashCode ^
      avatarUrls.hashCode ^
      isSuperAdmin.hashCode;
  }
}

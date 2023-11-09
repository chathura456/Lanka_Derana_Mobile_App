import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:lanka_derana/data/models/ad_media.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:lanka_derana/data/models/user.dart';

class ApiService {
  static const String baseUrl = 'https://lankaderana.lk/wp-json/wp/v2';

  Future<List<AdPost>> fetchAdPosts({int page = 1, int perPage = 20}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/ad_post?per_page=$perPage&page=$page'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<AdPost> list =
          jsonData.map((data) => AdPost.fromJson(data)).toList();

      for (AdPost adPost in list) {
        List<AdMedia> mediaList = await _fetchMediaForAdPost(adPost);
        if (mediaList.isNotEmpty) {
          adPost.imageUrl = mediaList[0].sourceUrl;
        }
      }

      return list;
    } else {
      throw Exception('Failed to load ad posts');
    }
  }

  Future<List<AdMedia>> _fetchMediaForAdPost(AdPost adPost) async {
    try {
      final response = await http.get(Uri.parse(
          'https://lankaderana.lk/wp-json/wp/v2/media?parent=${adPost.id}'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((data) => AdMedia.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load media for ad post ${adPost.id}');
      }
    } catch (error) {
      print('Error fetching media: $error');
      rethrow; // Re-throw the error to handle it further up the call stack
    }
  }

  Future<List<User>> fetchUsers({int page = 1, int perPage = 100}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/users?per_page=$perPage&page=$page'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:lanka_derana/data/services/api_service.dart';

final apiService = ApiService(); 

final adPostProvider = FutureProvider<List<AdPost>>((ref) async {
  final adPosts = await apiService.fetchAdPosts();
  return adPosts;

});

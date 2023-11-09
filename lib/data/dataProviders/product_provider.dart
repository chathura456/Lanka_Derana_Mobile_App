import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanka_derana/data/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final itemsProvider = FutureProvider<List<ProductModel>>((ref) async {
  return fetchProducts();
});

Future<List<ProductModel>> fetchProducts() async {
  final response = await http.get(
    Uri.parse(
      'https://www.lankaderana.lk/wp-json/wc/v3/products?consumer_key=ck_c5f49776f0db16cc129227127a00b08fa0e804cc&consumer_secret=cs_e7fe0f025361b0c61fa9aff500deacd27351b636',
    ),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    print('------------------------------------------- $jsonList');
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

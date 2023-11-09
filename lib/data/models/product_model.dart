import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String price;
  final String date_created;
  // Add more fields here as needed

  const ProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.price,
    required this.date_created,
    // Initialize other fields here
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object?> get props => [id, name, slug, permalink, price, date_created];

  // Add additional properties here if needed
}

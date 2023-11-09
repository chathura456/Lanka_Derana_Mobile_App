class ProductItem {
  final String title;
  final String description;
  final double price;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String imageUrl5;
  final int views;
  final String location;
  final String condition;

  final String categoryTitle;
  final String subCategoryTitle;
  final String vendorName;

  final DateTime createdDate;

  ProductItem({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.imageUrl5,
    required this.views,
    required this.location,
    required this.condition,
    required this.categoryTitle,
    required this.subCategoryTitle,
    required this.vendorName,
    DateTime? createdDate,
  }) : createdDate = createdDate ?? DateTime.now();
}

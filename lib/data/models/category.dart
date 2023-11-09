class Category {
  final String imageUrl;
  final String title;
  final List<String> subCategories;
  final DateTime createdDate;

  Category({
    required this.imageUrl,
    required this.title,
    required this.subCategories,
    DateTime? createdDate,
  }) : createdDate = createdDate ?? DateTime.now();
}

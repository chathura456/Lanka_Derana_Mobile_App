class Vendor {
  final String name;
  final int rating;
  final List<String> sourceUrl;
  final DateTime createdDate;

  Vendor({
    required this.name,
    required this.rating,
    required this.sourceUrl,
    DateTime? createdDate,
  }) : createdDate = createdDate ?? DateTime.now();
}

class AdMedia {
  final int id;
  final String sourceUrl;

  AdMedia({
    required this.id,
    required this.sourceUrl,
  });

  factory AdMedia.fromJson(Map<String, dynamic> json) {
    return AdMedia(
      id: json['id'],
      sourceUrl: json['media_details']['sizes']['medium']['source_url'],
    );
  }
}

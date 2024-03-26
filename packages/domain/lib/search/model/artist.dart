part of domain;

abstract class Artist {
  final String? externalUrl;
  final int? followers;
  final String? genres;
  final String? id;
  final Images? images;
  final String? name;
  final String? type;

  Artist(
      {required this.externalUrl,
      required this.followers,
      required this.genres,
      required this.id,
      required this.images,
      required this.name,
      required this.type});
}

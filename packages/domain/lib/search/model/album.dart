part of domain;

abstract class Album {
  final List<Artist?>? artist;
  final String? externalUrl;
  final String? id;
  final Images? images;
  final String? name;
  final String? date;
  final int? totalTracks;

  Album(
      {required this.artist,
      required this.externalUrl,
      required this.id,
      required this.images,
      required this.name,
      required this.date,
      required this.totalTracks});
}

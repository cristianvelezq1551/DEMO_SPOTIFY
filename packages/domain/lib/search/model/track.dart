part of domain;

abstract class Track {
  final Album? album;
  final List<Artist?>? artist;
  final String? externalUrl;
  final String? id;
  final String? name;
  final String? previewUrl;

  Track(
      {required this.album,
      required this.artist,
      required this.externalUrl,
      required this.id,
      required this.name,
      required this.previewUrl});
}

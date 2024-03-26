part of domain;

abstract class Search {
  final List<Album?>? album;
  final List<Track?>? track;
  final List<Artist?>? artist;

  Search({required this.album, required this.track, required this.artist});
}

abstract class Images {
  final String url;
  final double? height;
  final double? width;

  Images({required this.url, required this.height, required this.width});
}

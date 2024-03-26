part of infrastructure;

class TrackModel extends Track {
  TrackModel(
      {required super.album,
      required super.artist,
      required super.externalUrl,
      required super.id,
      required super.name,
      required super.previewUrl});

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
      album: json['album'] != null ? AlbumModel.fromJson(json['album']) : null,
      artist: json['artists'] != null
          ? (json['artists'] as List)
              .map((e) => ArtistModel.fromJson(e))
              .toList()
          : null,
      externalUrl: json['external_urls']['spotify'],
      id: json['id'],
      name: json['name'],
      previewUrl: json['preview_url']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['album'] = (album as AlbumModel?)?.toJson();
    data['artists'] = (artist as ArtistModel?)?.toJson();
    data['external_urls']['spotify'] = externalUrl;
    data['id'] = id;
    data['name'] = name;
    data['name'] = name;
    data['preview_url'] = previewUrl;
    return data;
  }
}

part of infrastructure;

class AlbumModel extends Album {
  AlbumModel(
      {required super.artist,
      required super.externalUrl,
      required super.id,
      required super.images,
      required super.name,
      required super.date,
      required super.totalTracks});

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
      artist: json['artists'] != null
          ? (json['artists'] as List)
              .map((e) => ArtistModel.fromJson(e))
              .toList()
          : null,
      externalUrl: json['external_urls']['spotify'],
      id: json['id'],
      images: json['images'] != null
          ? (json['images'] as List)
              .map((e) => ImagesModel.fromJson(e))
              .toList()
              .last
          : null,
      name: json['name'],
      date: json['release_date'],
      totalTracks: json['total_tracks']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['artists'] =
        (artist as List<ArtistModel>?)?.map((e) => e.toJson()).toList();
    data['external_urls']['spotify'] = externalUrl;
    data['id'] = id;
    data['images'] =
        (images as List<ImagesModel>?)?.map((e) => e.toJson()).toList();
    data['name'] = name;
    data['release_date'] = date;
    data['total_tracks'] = totalTracks;
    return data;
  }
}

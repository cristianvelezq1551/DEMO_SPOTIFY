part of infrastructure;

class SearchModel extends Search {
  SearchModel(
      {required super.album, required super.track, required super.artist});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
      album: json['albums'] != null && json['albums']['items'] != null
          ? (json['albums']['items'] as List)
              .map((e) => AlbumModel.fromJson(e))
              .toList()
          : null,
      track: json['tracks'] != null && json['tracks']['items'] != null
          ? (json['tracks']['items'] as List)
              .map((e) => TrackModel.fromJson(e))
              .toList()
          : null,
      artist: json['artists'] != null && json['artists']['items'] != null
          ? (json['artists']['items'] as List)
              .map((e) => ArtistModel.fromJson(e))
              .toList()
          : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albums']['items'] =
        (album as List<AlbumModel>?)?.map((e) => e.toJson()).toList();
    data['tracks']['items'] =
        (track as List<TrackModel>?)?.map((e) => e.toJson()).toList();
    data['artists']['items'] =
        (artist as List<ArtistModel>?)?.map((e) => e.toJson()).toList();
    return data;
  }
}

class ImagesModel extends Images {
  ImagesModel(
      {required super.url, required super.height, required super.width});

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
      url: json['url'],
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}

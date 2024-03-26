part of infrastructure;

class ArtistModel extends Artist {
  ArtistModel(
      {required super.externalUrl,
      required super.followers,
      required super.genres,
      required super.id,
      required super.images,
      required super.name,
      required super.type});

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
      externalUrl: json['external_urls']['spotify'],
      followers:
          (json['followers'] != null && json['followers']['total'] != null)
              ? json['followers']['total']
              : 0,
      genres: (json['genres'] != null && json['genres'].isNotEmpty)
          ? (json['genres'] as List).first
          : null,
      id: json['id'],
      images: (json['images'] != null && json['images'].isNotEmpty)
          ? (json['images'] as List)
              .map((e) => ImagesModel.fromJson(e))
              .toList()
              .first
          : null,
      name: json['name'],
      type: json['type']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['external_urls']['spotify'] = externalUrl;
    data['followers']['total'] = followers;
    data['genres'] = (genres as List<String>?)?.last;
    data['id'] = id;
    data['images'] = (images as List<ImagesModel>?)?.last;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}

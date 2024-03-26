part of infrastructure;

class SearchService extends SearchDataSource {
  final Dio _dio;

  SearchService({required Dio dio}) : _dio = dio;

  @override
  Future<Search> getData({required String search}) async {
    try {
      final response = await _dio.get(
        '/search',
        queryParameters: {
          'q': search,
          'type': 'artist,album,track',
          'limit': 5,
          'include_external': 'audio',
        },
      );

      final data = SearchModel.fromJson(response.data);

      return data;
    } on DioException catch (e) {
      log('getData => $e');
      rethrow;
    }
  }

  @override
  Future<List<Track?>?> getRecommendations(
      {required String artistId, required String trackId}) async {
    try {
      final response = await _dio.get(
        '/recommendations',
        queryParameters: {
          'seed_artists': artistId,
          'seed_tracks': trackId,
        },
      );

      final tracks = (response.data['tracks'] as List)
          .map((e) => TrackModel.fromJson(e))
          .toList();

      return tracks;
    } on DioException catch (e) {
      log('getRecommendations => $e');
      rethrow;
    }
  }

  @override
  Future<Artist?> getArtist({required String artistId}) async {
    try {
      final response = await _dio.get('/artists/$artistId');

      final data = ArtistModel.fromJson(response.data);

      return data;
    } on DioException catch (e) {
      log('getArtist => $e');
      rethrow;
    }
  }
}

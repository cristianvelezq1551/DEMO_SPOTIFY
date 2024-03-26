part of domain;

abstract class SearchRepository {
  /// Get data by search
  Future<Search> getData({required String search});

  // Get Recommendations
  Future<List<Track?>?> getRecommendations(
      {required String artistId, required String trackId});

  // Get artist
  Future<Artist?> getArtist({required String artistId});
}

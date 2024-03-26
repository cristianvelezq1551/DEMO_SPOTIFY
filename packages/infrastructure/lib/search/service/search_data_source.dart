part of infrastructure;

abstract class SearchDataSource {
  Future<Search> getData({required String search});

  Future<List<Track?>?> getRecommendations(
      {required String artistId, required String trackId});

  Future<Artist?> getArtist({required String artistId});
}

part of infrastructure;

class SearchRepositoryImpl extends SearchRepository {
  final SearchDataSource searchDataSource;

  SearchRepositoryImpl(this.searchDataSource);
  @override
  Future<Search> getData({required String search}) =>
      searchDataSource.getData(search: search);

  @override
  Future<List<Track?>?> getRecommendations(
          {required String artistId, required String trackId}) =>
      searchDataSource.getRecommendations(artistId: artistId, trackId: trackId);

  @override
  Future<Artist?> getArtist({required String artistId}) =>
      searchDataSource.getArtist(artistId: artistId);
}

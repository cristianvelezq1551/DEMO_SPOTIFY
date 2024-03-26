part of domain;

class SearchUseCase {
  final SearchRepository _searchRepository;

  SearchUseCase({required SearchRepository searchRepository})
      : _searchRepository = searchRepository;

  Future<Search> getData({required String search}) =>
      _searchRepository.getData(search: search);

  Future<List<Track?>?> getRecommendations(
          {required String artistId, required String trackId}) =>
      _searchRepository.getRecommendations(
          artistId: artistId, trackId: trackId);

  Future<Artist?> getArtist({required String artistId}) =>
      _searchRepository.getArtist(artistId: artistId);
}

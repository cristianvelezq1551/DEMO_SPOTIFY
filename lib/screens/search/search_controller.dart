import 'package:domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dependency_injector/dependency_injector.dart';

class SearchController {
  final SearchUseCase _searchUseCase;

  SearchController({required SearchUseCase searchUseCase})
      : _searchUseCase = searchUseCase {
    print('---------');
    print('SearchController Init');
    print('---------');
  }

  Future<Search> getData({required String search}) =>
      _searchUseCase.getData(search: search);

  Future<List<Track?>?> getRecommendations(
          {required String artistId, required String trackId}) =>
      _searchUseCase.getRecommendations(artistId: artistId, trackId: trackId);

  Future<Artist?> getArtist({required String artistId}) =>
      _searchUseCase.getArtist(artistId: artistId);
}

final searchControllerProvider = Provider((ref) => SearchController(
    searchUseCase: DependencyInjector().getIt<SearchUseCase>()));

import 'dart:async';
import 'dart:developer';

import 'package:demo_spotify/core/resources/images.dart';
import 'package:demo_spotify/messages/messages.dart';
import 'package:demo_spotify/screens/search/messages/search_messages.dart';
import 'package:demo_spotify/screens/search/search_controller.dart';
import 'package:demo_spotify/widgets/cached_network_images/cached_network_images_general.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infrastructure/infrastructure.dart';

import '../../widgets/input/input_general.dart';
import '../../widgets/track/empty_track.dart';
import '../../widgets/track/play_track.dart';
import '../auth/auth_controller.dart';

// Widgets
part 'widgets/empty_view.dart';
part 'widgets/search_view.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController searchController;
  late Search search;
  Timer? debounce;

  @override
  void initState() {
    searchController = TextEditingController();
    searchController.addListener(onSearchChanged);
    search = SearchModel(album: [], track: [], artist: []);
    super.initState();
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  // Listeners
  void onSearchChanged() {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 300), () async {
      if (searchController.text.trim().length >= 3) {
        // Realiza la búsqueda
        try {
          final searchResult = await ref
              .read(searchControllerProvider)
              .getData(search: searchController.text);
          if (mounted) {
            setState(() {
              search = SearchModel(
                  album: searchResult.album,
                  track: searchResult.track,
                  artist: searchResult.artist);
            });
          }
        } catch (e) {
          log("onSearchChanged => $e");
          if (mounted) {
            setState(() {
              search = SearchModel(album: [], track: [], artist: []);
            });
            Messages.noWifi(context);
          }
        }
      } else {
        if (mounted) {
          setState(() {
            search = SearchModel(album: [], track: [], artist: []);
          });
        }
      }
    });
  }

  // Limpiar los lugares
  void clear() {
    searchController.clear();
    if (mounted) {
      setState(() {
        search = SearchModel(album: [], track: [], artist: []);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(authControllerProvider);
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Buscar',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                    ),
                    InkWell(
                      child: const Icon(Icons.logout),
                      onTap: () => controller.logout(),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                TffGeneral(
                  controller: searchController,
                  hintText: 'Busca tu música favorita',
                  suffixIcon: search.album!.isNotEmpty ||
                          search.track!.isNotEmpty ||
                          search.artist!.isNotEmpty
                      ? IconButton(
                          onPressed: clear, icon: const Icon(Icons.close))
                      : null,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: search.album!.isEmpty &&
                            search.track!.isEmpty &&
                            search.artist!.isEmpty
                        ? const _EmptyView()
                        : _SearchView(
                            search: search,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

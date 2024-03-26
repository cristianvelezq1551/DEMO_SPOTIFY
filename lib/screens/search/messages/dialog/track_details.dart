part of '../search_messages.dart';

class _TrackDetailsDialog extends ConsumerStatefulWidget {
  final Track? track;

  const _TrackDetailsDialog({super.key, required this.track});

  @override
  _TrackDetailsDialogState createState() => _TrackDetailsDialogState();
}

class _TrackDetailsDialogState extends ConsumerState<_TrackDetailsDialog> {
  late AudioPlayer player;
  bool _isLoading = true;
  dynamic _artistData;
  List<Track?>? _recommendedTracks;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final controller = ref.read(searchControllerProvider);
    final artistId = widget.track?.artist?.first?.id;
    final trackId = widget.track?.id;
    try {
      final artistData = await controller.getArtist(artistId: '$artistId');
      final recommendedTracks = await controller.getRecommendations(
          artistId: '$artistId', trackId: '$trackId');

      setState(() {
        _artistData = artistData;
        _recommendedTracks = recommendedTracks;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    final track = widget.track;

    return Scaffold(
      body: _isLoading
          ? const Center(child: LoadingGeneral())
          : ListView(
              children: [
                _FrontPage(
                    artistData: _artistData,
                    size: size,
                    theme: theme,
                    track: track),
                ItemPlayer(
                  player: player,
                  preview: '${track?.previewUrl}',
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recomendaciones',
                    style: theme.titleMedium,
                  ),
                ),
                _recommendedTracks != null && _recommendedTracks!.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _recommendedTracks!.length,
                        itemBuilder: (context, index) {
                          final track = _recommendedTracks![index];
                          return _ItemTrack(track: track);
                        },
                      )
                    : const IsEmptyGeneral(
                        text: "Oops! It's empty",
                        icon: MetSvg.noWifi,
                      ),
              ],
            ),
    );
  }
}

class _FrontPage extends StatelessWidget {
  const _FrontPage({
    super.key,
    required artistData,
    required this.size,
    required this.theme,
    required this.track,
  }) : _artistData = artistData;

  final dynamic _artistData;
  final Size size;
  final TextTheme theme;
  final Track? track;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImagesGeneral(
          imageUrl: '${_artistData?.images?.url}',
          size: size.width,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: size.width,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.background
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onBackground)),
              ),
              const Expanded(child: SizedBox()),
              Text('${_artistData?.name}',
                  style: theme.headlineLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              Text('${track?.name}',
                  style: theme.titleLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ItemTrack extends StatelessWidget {
  const _ItemTrack({
    super.key,
    required this.track,
  });

  final Track? track;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: track?.previewUrl != null
          ? PlayTrack(
              onTap: () {
                Navigator.pop(context);
                SearchMessages.trackDetailsView(context, track: track);
              },
            )
          : const EmptyPlayTrack(),
      title: Text(track?.name ?? ''),
      subtitle: Text(track?.artist?.first?.name ?? ''),
    );
  }
}

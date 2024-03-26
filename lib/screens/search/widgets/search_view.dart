part of '../search_screen.dart';

class _SearchView extends StatefulWidget {
  const _SearchView({super.key, required this.search});

  final Search search;

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...widget.search.album!.map((album) => _ItemAlbum(
            onTap: () => SearchMessages.externalUrlView(context,
                url: album!.externalUrl!, title: album.name!),
            imageUrl: album?.images?.url,
            subtitle: 'Album',
            title: album?.name)),
        ...widget.search.track!.map(
          (track) => _ItemTrack(track: track),
        ),
        ...widget.search.artist!.map(
          (artist) => _ItemAlbum(
              onTap: () => SearchMessages.externalUrlView(context,
                  url: artist!.externalUrl!, title: artist.name!),
              title: artist?.name,
              subtitle: artist?.type,
              imageUrl: artist?.images?.url),
        ),
      ],
    );
  }
}

class _ItemAlbum extends StatelessWidget {
  const _ItemAlbum(
      {super.key,
      required this.onTap,
      required this.imageUrl,
      required this.subtitle,
      required this.title});

  final void Function()? onTap;
  final String? title, imageUrl, subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: CachedNetworkImagesGeneral(
        imageUrl: imageUrl,
      ),
      subtitle: Text(subtitle ?? '', maxLines: 1),

      // Aquí puedes agregar más detalles del artista
    );
  }
}

class _ItemTrack extends StatelessWidget {
  const _ItemTrack({super.key, required this.track});

  final Track? track;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: track?.previewUrl != null
            ? PlayTrack(
                onTap: () =>
                    SearchMessages.trackDetailsView(context, track: track))
            : const EmptyPlayTrack(),
        title: Text(
          track?.name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(track?.artist?.first?.name ?? '', maxLines: 1));
  }
}

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:demo_spotify/screens/search/search_controller.dart';
import 'package:demo_spotify/widgets/cached_network_images/cached_network_images_general.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/resources/icons.dart';
import '../../../widgets/app_bar/app_bar_general.dart';
import '../../../widgets/is_empty/is_empty_general.dart';
import '../../../widgets/loading/loading_general.dart';
import '../../../widgets/track/empty_track.dart';
import '../../../widgets/track/play_track.dart';
import '../widgets/item_player.dart';

///dialogs
part 'dialog/external_url.dart';
part 'dialog/track_details.dart';

abstract class SearchMessages {
  static void externalUrlView(BuildContext context,
      {required String url, required String title}) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      builder: ((context) => _ExternalUrlDialog(url: url, title: title)),
    );
  }

  static void trackDetailsView(BuildContext context, {required Track? track}) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      builder: ((context) => _TrackDetailsDialog(track: track)),
    );
  }
}

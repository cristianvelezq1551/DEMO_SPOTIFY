import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/icons.dart';
import '../buttons/btn_general.dart';

class DisconnectErrorView extends StatelessWidget {
  const DisconnectErrorView({super.key, this.voidCallback});

  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  MetSvg.noWifi,
                  height: 150,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(height: 20),
                Text(
                  'Error',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: voidCallback != null,
                  child: BtnGeneral(
                    text: 'Refrescar',
                    onPressed: voidCallback,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

part of '../search_screen.dart';

class _EmptyView extends StatelessWidget {
  const _EmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Explora un mundo de sonidos y encuentra tu melodía perfecta',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  )),
          Image.asset(AppImages.search, height: 200),
        ],
      ),
    );
  }
}

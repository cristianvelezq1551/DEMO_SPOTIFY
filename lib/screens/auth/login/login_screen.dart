import 'package:demo_spotify/core/resources/images.dart';
import 'package:demo_spotify/screens/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Text('Millions of Musics',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                const SizedBox(height: 15),
                Text(
                    'Be the first to discover, play and share your favorite tracks from emerging artits',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white)),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary),
                  child: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () => authController.authenticate(context)),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

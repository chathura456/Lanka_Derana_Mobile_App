import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanka_derana/data/dataProviders/ad_post_provider.dart';
import 'package:lanka_derana/data/loaded_data/data.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:lanka_derana/presentation/pages/tab_page.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<AdPost>> adPosts = ref.watch(adPostProvider);

    return adPosts.when(
      data: (adPostList) {
        loadedAdPostList = adPostList;
        return const TabPage();
      },
      loading: () => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: ScaleTransition(
            scale: const AlwaysStoppedAnimation(0.6), // Scale from 80% to 100%
            child: Image.asset('assets/images/logo.jpg'),
          ),
        ),
      ),
      error: (error, stackTrace) => Center(child: Text('Error: $adPosts')),
    );
  }
}

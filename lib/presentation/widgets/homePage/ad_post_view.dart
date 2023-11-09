import 'package:flutter/material.dart';
import 'package:lanka_derana/data/dataProviders/ad_post_provider.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:lanka_derana/presentation/widgets/homePage/ad_post_card.dart';

class AdPostView extends StatefulWidget {
  const AdPostView({required this.adPostsList, Key? key}) : super(key: key);

  final List<AdPost> adPostsList;

  @override
  State<StatefulWidget> createState() {
    return _AdPostViewState();
  }
}

class _AdPostViewState extends State<AdPostView> {
  int currentPage = 1;
  List<AdPost> allAdPosts = [];
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    allAdPosts = widget.adPostsList;
  }

  Future<void> _loadMoreData() async {
    print('------- fetching more data -------');
    // Increment the current page and fetch more data
    currentPage++;
    final newAdPosts =
        await apiService.fetchAdPosts(page: currentPage, perPage: 10);
    setState(() {
      allAdPosts.addAll(newAdPosts);
    });
    print('---------------------------------  ${allAdPosts.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (!_isLoadingMore &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            setState(() {
              _isLoadingMore = true;
            });
            _loadMoreData().then((_) {
              _isLoadingMore = false;
            });
            _isLoadingMore = true;
          }
          return false;
        },
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 0.65,
          ),
          itemCount: _isLoadingMore ? allAdPosts.length + 1 : allAdPosts.length,
          itemBuilder: (context, index) {
            if (index < allAdPosts.length) {
              final adPost = allAdPosts[index];
              return AdPostCard(adPost: adPost);
            } else {
              return _isLoadingMore
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

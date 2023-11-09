import 'package:flutter/material.dart';
import 'package:lanka_derana/data/loaded_data/data.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:lanka_derana/presentation/widgets/homePage/ad_post_view.dart';

import '../../data/models/category.dart';
import '../widgets/searchPage/catagory_view.dart';
import '../widgets/searchPage/sub_categories_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool isSearched = false;
  List<AdPost> filteredAdPostList = [];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void search(String searchText) {
    filteredAdPostList = loadedAdPostList.where((adPost) {
      return adPost.title.rendered
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();
    print(
        '---------------------------- Performing search: $filteredAdPostList');
  }

  @override
  Widget build(BuildContext context) {
    onSelectCategory(Category category) {
      // open sub categories
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoriesView(category: category),
          ));
    }

    return GestureDetector(
      onTap: () => _searchFocusNode.unfocus(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              focusNode: _searchFocusNode,
              controller: _textEditingController,
              onSubmitted: (value) {
                isSearched = true;
                setState(() {
                  search(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'What are you looking for',
                suffixIcon: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      final searchText = _textEditingController.text;
                      isSearched = true;
                      setState(() {
                        search(searchText);
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          isSearched
              ? AdPostView(adPostsList: filteredAdPostList,)
              : CategoryView(onTapCategory: onSelectCategory),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lanka_derana/data/models/category.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final subCategoriesList = [
      'All Ads in ${category.title}',
      ...category.subCategories,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Image.asset(category.imageUrl),
        ),
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final category in subCategoriesList)
            ListTile(
              title: Text(category),
              onTap: () {
                // Dispatch the event to filter products based on the selected category
              },
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

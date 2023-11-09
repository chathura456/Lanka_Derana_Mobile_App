import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dataProviders/category_provider.dart';
import '../../../data/models/category.dart';

class CategoryView extends ConsumerWidget {
  const CategoryView({super.key, required this.onTapCategory});

  final Function(Category item) onTapCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.read(categoryProvider);

    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(35),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categoryList.map((item) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => onTapCategory(item),
                child: Column(
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.asset(
                        item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        item.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

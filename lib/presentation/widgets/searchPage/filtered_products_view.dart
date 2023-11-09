import 'package:flutter/material.dart';

import '../../../data/models/item.dart';

class FilteredProductsView extends StatelessWidget {
  const FilteredProductsView(
      {super.key,
      required this.filteredProductList,
      required this.subCategory});

  final List<ProductItem> filteredProductList;
  final String subCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          subCategory,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: const Center(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lanka_derana/presentation/widgets/posting_ad_pageviews/basic_info_form.dart';

import '../../../data/models/category.dart';
import '../searchPage/catagory_view.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  onSelectCategory(Category item) {
    // print(item.title);
    Navigator.push(context, MaterialPageRoute(builder: (context) => BasicInfoForm(item: item),));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Text(
            'Select a category first',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        CategoryView(onTapCategory: onSelectCategory)
      ],
    );
  }
}

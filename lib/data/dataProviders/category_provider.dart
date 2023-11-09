import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'category_data.dart';


final categoryProvider = Provider(
  (ref) {
    return categoryList;
  },
);
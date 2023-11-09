import 'package:flutter/material.dart';

import '../../widgets/filters/vendors_filter.dart';


class VendorsFilterPage extends StatefulWidget {
  const VendorsFilterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VendorsFilterPageState();
  }
}

class _VendorsFilterPageState extends State<VendorsFilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter Vendors',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const VendorsFilter(),
    );
  }
}

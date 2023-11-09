import 'package:flutter/material.dart';

import '../../../data/models/vendor.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({super.key, required this.vendor});

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    // void selectItem() {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => VendorDetailsPage(vendor: vendor),
    //   ));
    // }

    return GestureDetector(
      // onTap: selectItem,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Image.network(
                    vendor.sourceUrl[2],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                vendor.name,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (vendor.rating == 0) const Text('No Rating'),
                  for (int i = 0; i < vendor.rating; i++)
                    const Icon(
                      Icons.star_border_rounded,
                      size: 23,
                    ),
                ],
              ),
              const Text('0 Reviews'),
              TextButton(onPressed: () {}, child: const Text('View Profile')),
            ],
          ),
        ),
      ),
    );
  }
}

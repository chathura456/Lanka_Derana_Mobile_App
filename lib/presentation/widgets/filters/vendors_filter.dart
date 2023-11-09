import 'package:flutter/material.dart';

class VendorsFilter extends StatefulWidget {
  const VendorsFilter({super.key, this.onSearch});

  final Function(String name, double rating)? onSearch;

  @override
  State<StatefulWidget> createState() {
    return _VendorsFilterState();
  }
}

class _VendorsFilterState extends State<VendorsFilter> {
  String _vendorName = '';
  double _rating = 0;

  void _updateRating(int selectedRating) {
    setState(() {
      _rating = selectedRating.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _vendorName = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Filter by vendor name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: IconButton(
                  onPressed: () {
                    // ...
                  },
                  icon: const Icon(Icons.search, color: Colors.black),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

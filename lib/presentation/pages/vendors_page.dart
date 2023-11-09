import 'package:flutter/material.dart';
import 'package:lanka_derana/data/models/user.dart';
import 'package:lanka_derana/data/models/vendor.dart';
import 'package:lanka_derana/data/services/api_service.dart';

import '../widgets/appvendors/vendor_card.dart';

class VendorsPage extends StatefulWidget {
  const VendorsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VendorsPageState();
  }
}

class _VendorsPageState extends State<VendorsPage> {
  String _searchedVendorName = '';
  final ApiService apiService = ApiService();
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = apiService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vendors',
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchedVendorName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Filter by vendor name',
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton.icon(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // ...
                  },
                  label: const Text('Filter Vendors'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromARGB(255, 255, 230, 0))),
                ),
              ],
            ),
            FutureBuilder<List<User>>(
              future: users,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(child: const Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<User> userList = snapshot.data!;
                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        User user = userList[index];
                        return VendorCard(
                          vendor: Vendor(
                            name: user.name,
                            rating: 0,
                            sourceUrl: user.avatarUrls,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('No Sellers available');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

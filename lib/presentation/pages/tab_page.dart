import 'package:flutter/material.dart';
import 'package:lanka_derana/presentation/pages/post_ad_page.dart';
import 'package:lanka_derana/presentation/pages/profile_page.dart';
import 'package:lanka_derana/presentation/pages/search_page.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'membership_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostAdPage(),
            ));
      }
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomePage();
    var activePageTitle = 'LankaDerana.lk';

    switch (_selectedPageIndex) {
      case 1:
        activePage = const SearchPage();
        activePageTitle = 'Search';
        break;
      case 3:
        activePage = const MembershipPage();
        activePageTitle = 'Membership Packages';
        break;
      case 4:
        activePage = const ProfilePage();
        activePageTitle = 'My Profile';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ));
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 200, 1, 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Icon(
                Icons.add_circle_rounded,
                color: Color.fromRGBO(119, 65, 0, 1.0),
                size: 32,
              ),
            ),
            label: 'Post Ad',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Membership',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Profile',
          ),
        ],
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}

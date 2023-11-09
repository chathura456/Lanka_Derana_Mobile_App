import 'package:flutter/material.dart';
import 'package:lanka_derana/presentation/pages/vendors_page.dart';
import '../widgets/profilePage/login_with_fb_button.dart';
import '../widgets/profilePage/login_with_google_button.dart';
import '../widgets/profilePage/mobile_number_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        Center(
          child: Text(
            'Welcome to LankaDerana.lk',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Text(
          'Login into manage your account',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 15),
        const MobileNumberForm(),
        const SizedBox(height: 15),
        Center(
          child: Text(
            'OR',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
        ),
        const SizedBox(height: 50),
        LoginWithGoogleButton(
          onPressed: () {},
        ),
        const SizedBox(height: 5),
        LoginWithFacebookButton(
          onPressed: () {},
        ),
      ],
    );

    if (isLogged) {
      //...
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          children: [
            Text(
              '{User Name}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                const ListTile(
                  leading: Icon(Icons.sell),
                  title: Text('My Ads'),
                ),
                const ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('My Membership'),
                ),
                const ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Favorite'),
                ),
                const ListTile(
                  leading: Icon(Icons.call),
                  title: Text('Phone Numbers'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VendorsPage(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.group),
                  title: const Text('Vendors'),
                ),
                const SizedBox(height: 15),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(height: 15),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.power_settings_new_sharp,
                    color: Color.fromRGBO(255, 200, 1, 1.0),
                  ),
                  label: Text(
                    'Log Out',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton.icon(
                  onPressed: () {
                    //..
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 200, 1, 1.0),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

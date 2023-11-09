import 'package:flutter/material.dart';

import '../widgets/membershipPage/package_card.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const PackageCard(
            bgColor: Color.fromARGB(255, 255, 193, 186),
            title: 'Free\nරු 0',
            featuresList: [
              {'title': 'Validity', 'value': 'Lifetime'},
              {'title': 'Ads', 'value': 'Unlimited'},
              {'title': 'Featured Ads', 'value': '0'},
              {'title': 'Bump-up Ads', 'value': '0'},
              {'title': 'No Of Images', 'value': '5'},
              {'title': 'Video URL', 'value': 'Yes'},
              {'title': 'Allow Tags', 'value': 'Yes'},
              {'title': 'Categories', 'value': 'All'},
            ],
          ),
          const PackageCard(
            bgColor: Color.fromARGB(255, 102, 255, 122),
            title: 'Basic\nරු 500',
            featuresList: [
              {'title': 'Validity', 'value': '60 Days'},
              {'title': 'Ads', 'value': 'Unlimited'},
              {'title': 'Featured Ads', 'value': '1'},
              {'title': 'Bump-up Ads', 'value': '1'},
              {'title': 'No Of Images', 'value': '5'},
              {'title': 'Video URL', 'value': 'Yes'},
              {'title': 'Allow Tags', 'value': 'Yes'},
              {'title': 'Categories', 'value': 'All'},
            ],
          ),
          const PackageCard(
            bgColor: Color.fromARGB(255, 227, 231, 0),
            title: 'Small Business\nරු 1,000',
            featuresList: [
              {'title': 'Validity', 'value': '60 Days'},
              {'title': 'Ads', 'value': 'Unlimited'},
              {'title': 'Featured Ads', 'value': '2'},
              {'title': 'Bump-up Ads', 'value': '2'},
              {'title': 'No Of Images', 'value': '5'},
              {'title': 'Video URL', 'value': 'Yes'},
              {'title': 'Allow Tags', 'value': 'Yes'},
              {'title': 'Categories', 'value': 'All'},
            ],
          ),
          const PackageCard(
            bgColor: Color.fromARGB(255, 216, 86, 255),
            title: 'Premium\nරු 2,000',
            featuresList: [
              {'title': 'Validity', 'value': '60 Days'},
              {'title': 'Ads', 'value': 'Unlimited'},
              {'title': 'Featured Ads', 'value': '5'},
              {'title': 'Bump-up Ads', 'value': '5'},
              {'title': 'No Of Images', 'value': '5'},
              {'title': 'Video URL', 'value': 'Yes'},
              {'title': 'Allow Tags', 'value': 'Yes'},
              {'title': 'Categories', 'value': 'All'},
            ],
          ),
          const PackageCard(
            bgColor: Color.fromARGB(181, 209, 24, 0),
            title: 'VIP Member\nරු 5,000',
            featuresList: [
              {'title': 'Validity', 'value': '60 Days'},
              {'title': 'Ads', 'value': 'Unlimited'},
              {'title': 'Featured Ads', 'value': '20'},
              {'title': 'Bump-up Ads', 'value': '20'},
              {'title': 'No Of Images', 'value': '5'},
              {'title': 'Video URL', 'value': 'Yes'},
              {'title': 'Allow Tags', 'value': 'Yes'},
              {'title': 'Categories', 'value': 'All'},
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please send your receipt to us via WhatsApp for faster processing',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Follow the instructions below:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                    '1. Complete the bank transfer using the provided details.',
                    style: TextStyle(fontSize: 16)),
                const Text(
                    '2. Take a screenshot or scan your receipt for the transaction.',
                    style: TextStyle(fontSize: 16)),
                const Text('3. Open WhatsApp on your mobile device.',
                    style: TextStyle(fontSize: 16)),
                const Text(
                    '4. Add our WhatsApp number (071 444 7279 / 071 512 6639) to your contacts.',
                    style: TextStyle(fontSize: 16)),
                const Text('5. Open a new chat with our WhatsApp number.',
                    style: TextStyle(fontSize: 16)),
                const Text(
                    '6. Attach the receipt image and provide any necessary information.',
                    style: TextStyle(fontSize: 16)),
                const Text(
                    '7. Send the message, and we will confirm your payment shortly.',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Text(
                  'If you have any questions or need assistance, please feel free to contact our customer support team at\n071 444 7279 / 071 512 6639.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

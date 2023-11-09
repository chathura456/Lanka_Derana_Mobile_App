import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AdDetailsPage extends StatelessWidget {
  const AdDetailsPage({super.key, required this.adPost});

  final AdPost adPost;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: adPost.title.rendered,
                    child: Image.network(
                      adPost.imageUrl!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adPost.title.rendered,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          DateFormat('dd MMM yyyy HH:mm')
                              .format(DateTime.parse(adPost.date)),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Location of poster',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Price On Call',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'For sale by member *Member Name*',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),
                        const SizedBox(height: 8),
                        HtmlWidget(adPost.desc),
                        const SizedBox(height: 25),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 60,
            color: Theme.of(context).colorScheme.primary,
            child: TextButton(
              onPressed: () {
                // Handle the "Call Now" button action
              },
              child: const Text(
                'Call Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

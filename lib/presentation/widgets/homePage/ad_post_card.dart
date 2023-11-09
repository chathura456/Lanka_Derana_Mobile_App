import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lanka_derana/data/loaded_data/data.dart';
import 'package:lanka_derana/data/models/ad_post.dart';
import 'package:lanka_derana/presentation/pages/ad_details_page.dart';

class AdPostCard extends StatefulWidget {
  const AdPostCard({super.key, required this.adPost});

  final AdPost adPost;

  @override
  State<AdPostCard> createState() => _AdPostCardState();
}

class _AdPostCardState extends State<AdPostCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;

    void selectItem() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AdDetailsPage(adPost: widget.adPost),
      ));
    }

    return GestureDetector(
      onTap: selectItem,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.adPost.imageUrl != null
                    ? SizedBox(
                        height: 130,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.adPost.imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 130,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.hide_image, color: primaryColor),
                            Text(
                              'No Images provided!',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.adPost.title.rendered,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: baseFontSize * deviceWidth / 380,
                    ),
                  ),
                ),
                Text(
                  'Price On Call',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: baseFontSize * deviceWidth / 320,
                  ),
                ),
                Text(
                  DateFormat('dd MMM yyyy HH:mm')
                      .format(DateTime.parse(widget.adPost.date)),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black45,
                        fontSize: baseFontSize * deviceWidth / 500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

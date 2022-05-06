import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail(
      {Key? key,
      required this.title,
      required this.image,
      required this.description})
      : super(key: key);
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light),
          expandedHeight:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.height * 0.5
                  : MediaQuery.of(context).size.height * 0.35,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
            image,
            fit: BoxFit.cover,
          )),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(20))),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          );
        }, childCount: 1))
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/pages/news_detail.dart';
import 'package:news_app/services/news_api.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  final NewsApi newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  floating: true,
                  title: Text(
                    'News',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ];
            },
            body: Center(
              child: FutureBuilder<List<News>>(
                future: newsApi.getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var news = snapshot.data![index];
                        return ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetail(
                                    title: news.name,
                                    description: news.description,
                                    image: news.image),
                              )),
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(
                            news.name,
                            style: const TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w600),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              decoration: const BoxDecoration(),
                              width: MediaQuery.of(context).size.width * 0.30,
                              child:
                                  Image.network(news.image, fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            )));
  }
}

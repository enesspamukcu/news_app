import 'package:dio/dio.dart';
import 'package:news_app/model/news.dart';

class NewsApi {
  Dio dio = Dio();
  String newsApiURL =
      'https://api.collectapi.com/news/getNews?country=tr&tag=general';

  Future<List<News>> getNews() async {
    var content = dio.options.headers['content-type'] = 'application/json';
    try {
      var response = await dio.get(newsApiURL,
          options: Options(headers: {
            'authorization':
                'apikey 6qOsTyjJ50Pkfhdfi5xCT2:6XbFGDNeSppYcRwbvAV5bf'
          }, contentType: content));
      List<News> newsList = [];
      if (response.statusCode == 200) {
        newsList=(response.data['result'] as List).map((e) => News.fromMap(e)).toList();
      }
      return newsList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}

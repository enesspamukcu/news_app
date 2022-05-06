import 'dart:convert';
News newsFromMap(String str) => News.fromMap(json.decode(str));

class News {
    News({
        required this.key,
        required this.url,
        required this.description,
        required this.image,
        required this.name,
        required this.source,
        required this.date,
    });

    String key;
    String url;
    String description;
    String image;
    String name;
    String source;
    DateTime? date;

    factory News.fromMap(Map<String, dynamic> json) => News(
        key: json["key"],
        url: json["url"],
        description: json["description"],
        image: json["image"],
        name: json["name"],
        source: json["source"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );
}
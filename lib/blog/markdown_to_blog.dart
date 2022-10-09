class BlogModel {
  String title;
  String subtitle;

  BlogModel.fromJson(Map json)
      : title = json['title'],
        subtitle = json['subtitle'];
}

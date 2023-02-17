class MovieModel {
  String? name;
  String? year;
  String? imageLink;
  double? rating;

  MovieModel({this.name, this.year, this.imageLink, this.rating});

  MovieModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    year = json['year'];
    imageLink = json['image_link'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['year'] = year;
    data['image_link'] = imageLink;
    data['rating'] = this.rating;
    return data;
  }
}
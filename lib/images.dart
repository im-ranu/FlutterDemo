import 'dart:convert';
List<Images> userFromJson(String str) => List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));
String userToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Images {
  Images({
    required this.userId,
    required this.description,
    required this.imageHref
  });
  int userId;
  String description;
  String imageHref;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    userId: json["userId"],
      description: json["description"],
      imageHref: json["imageHref"]
  );
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "description": description,
    "imageHref": imageHref
  };
}

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'images.dart';
import 'images_response.dart';

class Network {

  final String postsURL = "https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf";

  Future<ImagesResponse> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
    var body = jsonDecode(res.body);

    /*  List<Images> posts = body
          .map(
            (dynamic item) => Images.fromJson(item),
      )
          .toList();*/
    ImagesResponse imagesResponse=ImagesResponse.fromJson(body);
      log('data: $body');

      return imagesResponse;
    } else {
      throw "Unable to retrieve posts.";
    }
  }



}

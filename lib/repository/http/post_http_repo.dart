import 'package:http/http.dart' as http;
import 'package:sqlite_clean/model/post_model.dart';
import 'package:sqlite_clean/util/http.dart';

class PostsHttpRepo {
  // Setup a singleton
  static final PostsHttpRepo _postsHttpRepo = PostsHttpRepo._internal();
  factory PostsHttpRepo() {
    return _postsHttpRepo;
  }
  PostsHttpRepo._internal();

  HttpClient httpClient = HttpClient();

  // Methods
  Future<Post> getHttpPost() async {
    http.Response response = await httpClient.getRequest(
      "top-headlines?country=us&category=business",
    );
    if (response != null && response.statusCode == 200) {
      print(response.body);
      final post = postFromJson(
        response.body,
      );
      return post;
    } else {
      return null;
    }
  }
}

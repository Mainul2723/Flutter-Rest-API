import 'package:weather_app/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var clientresponse = await client.get(uri);
    if (clientresponse.statusCode == 200) {
      var json = clientresponse.body;
      return postsFromJson(json);
    }
    return null;
  }
}

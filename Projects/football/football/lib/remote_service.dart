import 'package:football/post.dart';
import 'package:http/http.dart' as http;

class Remote {
  Future<Posts?> getData() async {
    var client = http.Client();
    var uri = Uri.parse('http://api.football-data.org/v4/competitions/');
    var clientResponse = await client.get(uri);
    if (clientResponse.statusCode == 200) {
      var json = clientResponse.body;
      //print(json); // Add this line to log the JSON data
      return postsFromJson(json);
    }
    return null;
  }
}

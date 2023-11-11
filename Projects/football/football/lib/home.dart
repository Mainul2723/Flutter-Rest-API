import 'package:flutter/material.dart';
import 'package:football/post.dart';
import 'package:football/remote_service.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Posts>? posts;
  var isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Posts?> getData() async {
    try {
      var client = http.Client();
      var uri = Uri.parse('http://api.football-data.org/v4/competitions/');
      var clientResponse = await client.get(uri);

      if (clientResponse.statusCode == 200) {
        var json = clientResponse.body;
        return postsFromJson(json);
      } else {
        print(
            "HTTP request failed with status code: ${clientResponse.statusCode}");
        return null; // Return null if the HTTP request is not successful
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null; // Return null if an exception occurs
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football')),
      body: Visibility(
        visible: isloaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length ?? 0,
          itemBuilder: (context, postsIndex) {
            final postsItem = posts?[postsIndex];
            if (postsItem != null) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 161, 83, 175),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        'Competition Name: ${postsItem.competitions[postsIndex].name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      'Competition Code: ${postsItem.competitions[postsIndex].code ?? "N/A"}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // You can display more information from the 'postsItem' or 'Competition' objects here
                ],
              );
            } else {
              // Handle the case where 'postsItem' is null
              return const Text(
                'Error: Unable to retrieve data',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

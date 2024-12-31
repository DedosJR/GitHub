import 'package:flutter/material.dart';
import 'package:maxiradiofm/Services/Api_Response.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<dynamic>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = ApiResponse.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _futurePosts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay publicaciones disponibles'));
        }

        final posts = snapshot.data!;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (post['_embedded']['wp:featuredmedia'] != null)
                    Image.network(
                      post['_embedded']['wp:featuredmedia'][0]['source_url'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      post['title']['rendered'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      post['excerpt']['rendered']
                          .replaceAll(RegExp(r'<[^>]*>'), ''), // Limpia HTML
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

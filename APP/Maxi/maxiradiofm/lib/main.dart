import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoticiasScreen(),
    );
  }
}

class NoticiasScreen extends StatefulWidget {
  @override
  _NoticiasScreenState createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
  ApiService apiService = ApiService();
  List<dynamic> noticias = [];

  @override
  void initState() {
    super.initState();
    cargarNoticias();
  }

  void cargarNoticias() async {
    final data = await apiService.fetchPosts();
    setState(() {
      noticias = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
      ),
      body: noticias.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final noticia = noticias[index];
                return ListTile(
                  title: Text(noticia['title']['rendered']),
                  subtitle: Text(noticia['excerpt']['rendered']),
                );
              },
            ),
    );
  }
}

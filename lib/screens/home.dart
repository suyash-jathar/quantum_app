// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quantum_it_application_1/screens/login.dart';
import 'package:quantum_it_application_1/services/google_sigin.dart';
import '../models/news_model.dart';
import '../services/api_service.dart';
import 'package:intl/intl.dart';

import '../widgets/new_search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsApiService newsApiService = NewsApiService();
  List<Article> allArticles = [];
  List<Article> filteredArticles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  final signOutSnackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        Text('  You have successfully logged out !'),
      ],
    ),
  );

  void fetchNews() async {
    try {
      final Map<String, dynamic> jsonData =
          await newsApiService.fetchNewsfromAPI();
      final NewsResponse newsResponse = NewsResponse.fromJson(jsonData);

      setState(() {
        allArticles = newsResponse.articles;
        filteredArticles = allArticles;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  void searchNews(String query) {
    setState(() {
      filteredArticles = allArticles
          .where((article) =>
              article.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        flexibleSpace: Column(children: [
          Container(
            height: 21,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          ),
          TextField(
            decoration: InputDecoration(
              prefixIconColor: Colors.blue,
              suffixIcon: IconButton(
                  onPressed: () {
                    signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    ScaffoldMessenger.of(context).showSnackBar(signOutSnackBar);
                  },
                  icon: Icon(Icons.logout_outlined, color: Colors.black)),
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  final selectedQuery = await showSearch(
                    context: context,
                    delegate: NewsSearch(filteredArticles),
                  );
                },
              ),
              hintText: 'Search in feed',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              searchNews(query);
            },
          ),
        ]),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filteredArticles.length,
              itemBuilder: (context, index) {
                final article = filteredArticles[index];

                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    trailing: Container(
                      height: 90,
                      width: 75,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: article.urlToImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          article.description,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          "${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(article.publishedAt))}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          "  ${article.source.name}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 18.0),
                      ],
                    ),
                    onTap: () {
                    },
                  ),
                );
              },
            ),
    );
  }
}

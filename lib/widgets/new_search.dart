import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsSearch extends SearchDelegate<String> {
  final List<Article> articles;

  NewsSearch(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredArticles = articles.where((article) {
      final articleTitle = article.title.toLowerCase();
      final queryText = query.toLowerCase();
      return articleTitle.contains(queryText);
    }).toList();

    return ListView.builder(
      itemCount: filteredArticles.length,
      itemBuilder: (context, index) {
        final article = filteredArticles[index];
        return ListTile(
          title: Text(article.title),
          subtitle: Text(article.description),
          onTap: () {
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); 
  }
}

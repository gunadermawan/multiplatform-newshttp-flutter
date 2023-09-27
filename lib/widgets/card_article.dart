import 'package:flutter/material.dart';
import 'package:newshttp/data/model/article.dart';

import '../ui/article_detail_page.dart';


class CardArticle extends StatelessWidget {
  const CardArticle({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(article.author ?? ""),
        onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article),
      ),
    );
  }
}

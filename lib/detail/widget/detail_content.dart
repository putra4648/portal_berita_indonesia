import 'package:flutter/material.dart';

import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/detail/widget/similiiar_news.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.article,
    required this.page,
  }) : super(key: key);

  final Article article;
  final int page;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.4),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Chip(
                avatar: const CircleAvatar(child: Icon(Icons.person)),
                label: Text(article.author ?? 'Tidak ada author'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                article.description ?? 'Tidak ada deskripsi',
                style: textTheme.bodyText1,
                textWidthBasis: TextWidthBasis.longestLine,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  if (article.url != null) {
                    launch(article.url!);
                  }
                },
                child: const Text('Selengkapnya'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Berita lainnya',
                style: textTheme.headline5,
              ),
            ),
            SimilliarNews(page: page),
          ],
        ),
      ),
    );
  }
}

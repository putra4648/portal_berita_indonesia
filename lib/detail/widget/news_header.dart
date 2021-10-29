import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';

class NewsHeader extends StatelessWidget {
  const NewsHeader({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: size.height * 0.47,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        image: article.urlImage != null
            ? DecorationImage(
                fit: BoxFit.fill,
                colorFilter:
                    const ColorFilter.mode(Colors.white12, BlendMode.lighten),
                image: NetworkImage(article.urlImage!),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              article.title ?? '',
              style: textTheme.headline5
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Selengkapnya'),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

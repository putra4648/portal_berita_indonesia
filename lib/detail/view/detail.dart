import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/detail/bloc/recommendation_news_bloc.dart';

class Detail extends StatefulWidget {
  const Detail({
    Key? key,
    required this.article,
    required this.page,
  }) : super(key: key);

  final Article article;
  final int page;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    context
        .read<RecommendationNewsBloc>()
        .add(RecommendedNewsGenerated(page: widget.page));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.47,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              image: widget.article.urlImage != null
                  ? DecorationImage(
                      fit: BoxFit.fill,
                      colorFilter: const ColorFilter.mode(
                          Colors.white12, BlendMode.lighten),
                      image: NetworkImage(widget.article.urlImage!),
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
                    widget.article.title ?? '',
                    style: textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
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
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.4),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadiusDirectional.vertical(
                top: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(
                      avatar: const CircleAvatar(child: Icon(Icons.person)),
                      label: Text(widget.article.author ?? ''),
                    ),
                    Chip(
                      avatar: const Icon(Icons.timer),
                      label: Text(durationTimer(widget.article.publishedAt)),
                    ),
                  ],
                ),
                Text(
                  widget.article.description ?? 'Tidak ada deskripsi',
                  style: textTheme.bodyText2,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Selengkapnya'),
                ),
                const Text('Berita lainnya'),
                Expanded(
                  child: BlocBuilder<RecommendationNewsBloc,
                      RecommendationNewsState>(
                    builder: (context, state) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.recommendedArticles.length,
                        itemBuilder: (context, index) {
                          return LimitedBox(
                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                // Navigator.of(context).push<Widget>(
                                //     MaterialPageRoute(builder: (context) {
                                //   return Detail(
                                //     article: state.recommendedArticles[index],
                                //     page: index++,
                                //   );
                                // }));
                              },
                              child: Column(
                                children: [
                                  /// News Image
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image:
                                              state.recommendedArticles[index]
                                                          .urlImage !=
                                                      null
                                                  ? DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(state
                                                          .recommendedArticles[
                                                              index]
                                                          .urlImage!),
                                                    )
                                                  : null,
                                        ),
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),

                                  /// News Title
                                  ListTile(
                                    title: Text(
                                      state.recommendedArticles[index].title ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.subtitle1?.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    isThreeLine: true,
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 5),
                                        Text(
                                          durationTimer(state
                                              .recommendedArticles[index]
                                              .publishedAt),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(state.recommendedArticles[index]
                                                .author ??
                                            '')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/detail/view/detail.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';

class BreakingNewsContent extends StatelessWidget {
  const BreakingNewsContent({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Breaking News',
              style: textTheme.headline5?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
              builder: (context, state) {
                if (state.error.isNotEmpty) {
                  return const SizedBox.shrink();
                }

                /// If loading is true and doesnt have error
                if (state.isLoading && state.error.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final _filteredBreakingNews =
                      state.breakingNewsArticles.getRange(1, 5).toList();
                  return NewsContent(
                    filteredBreakingNews: _filteredBreakingNews,
                    textTheme: textTheme,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class NewsContent extends StatelessWidget {
  const NewsContent({
    Key? key,
    required List<Article> filteredBreakingNews,
    required this.textTheme,
  })  : _filteredBreakingNews = filteredBreakingNews,
        super(key: key);

  final List<Article> _filteredBreakingNews;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: _filteredBreakingNews.length,
      itemBuilder: (context, index) {
        return LimitedBox(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.of(context).push<Widget>(
                MaterialPageRoute(
                  builder: (context) {
                    return Detail(
                      article: _filteredBreakingNews[index],
                      page: index + 5,
                    );
                  },
                ),
              );
            },
            child: Column(
              children: [
                /// News Image
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: _filteredBreakingNews[index].urlImage != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    _filteredBreakingNews[index].urlImage!),
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
                    _filteredBreakingNews[index].title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.subtitle1
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  isThreeLine: true,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        durationTimer(_filteredBreakingNews[index].publishedAt),
                      ),
                      const SizedBox(height: 5),
                      Text(_filteredBreakingNews[index].author ?? '')
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

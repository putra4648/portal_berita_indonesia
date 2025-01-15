import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';

class BreakingNewsHeader extends StatelessWidget {
  const BreakingNewsHeader({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.5 - kBottomNavigationBarHeight,
      child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
        buildWhen: (previous, current) => previous != current,
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
            final _filteredBreakingNews = state.breakingNewsArticles.first;
            return NewsHeaderContent(
              filterSingleBreakingNews: _filteredBreakingNews,
              textTheme: textTheme,
            );
          }
        },
      ),
    );
  }
}

class NewsHeaderContent extends StatelessWidget {
  const NewsHeaderContent({
    Key? key,
    required Article filterSingleBreakingNews,
    required this.textTheme,
  })  : _filterSingleBreakingNews = filterSingleBreakingNews,
        super(key: key);

  final Article _filterSingleBreakingNews;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        image: _filterSingleBreakingNews.urlImage != null
            ? DecorationImage(
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.white12, BlendMode.lighten),
                image: NetworkImage(_filterSingleBreakingNews.urlImage!),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30,
                    sigmaY: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text('Berita hari ini',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              _filterSingleBreakingNews.title ?? '',
              style: textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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

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
    return Expanded(
      child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
        builder: (context, state) {
          if (state is BreakingNewsLoading) {
            return Container(
              color: Colors.black,
            );
          } else if (state is BreakingNewsLoadedSuccess) {
            final _filterSingleBreakingNews = state.breakingNewsArticles.first;
            return NewsHeaderContent(
              filterSingleBreakingNews: _filterSingleBreakingNews,
              textTheme: textTheme,
            );
          } else if (state is BreakingNewsFailed) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const SizedBox.shrink();
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
                fit: BoxFit.fill,
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
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              _filterSingleBreakingNews.title ?? '',
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

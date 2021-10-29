import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/detail/bloc/recommendation_news_bloc.dart';
import 'package:portal_berita_indonesia/detail/widget/detail_content.dart';
import 'package:portal_berita_indonesia/detail/widget/news_header.dart';
import 'package:portal_berita_indonesia/saved/bloc/saved_news_bloc.dart';

class Detail extends StatefulWidget {
  const Detail({
    Key? key,
    required this.article,
    required this.page,
  }) : super(key: key);

  final Article article;
  final int page;

  static const route = '/detail';
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(Detail(
              article: const Article(),
              page: widget.page + 5,
            ));
          },
        ),
        actions: [
          BlocBuilder<SavedNewsBloc, SavedNewsState>(builder: (context, state) {
            return IconButton(
              onPressed: () {
                if (state.savedArticles.contains(widget.article)) {
                  context
                      .read<SavedNewsBloc>()
                      .add(SavedNewsDeleted(article: widget.article));
                } else {
                  context
                      .read<SavedNewsBloc>()
                      .add(SavedNewsAdded(article: widget.article));
                }
              },
              icon: state.savedArticles.contains(widget.article)
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_add_outlined),
            );
          }),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          NewsHeader(article: widget.article),

          /// Other News
          DetailContent(article: widget.article, page: widget.page),
        ],
      ),
    );
  }
}

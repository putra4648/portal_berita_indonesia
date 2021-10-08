import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider<BreakingNewsBloc>(
      create: (_) =>
          BreakingNewsBloc(newsRepository: context.read<NewsRepository>())
            ..add(BreakingNewsFetched()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            /// Header News
            Expanded(
              child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
                builder: (context, state) {
                  if (state is BreakingNewsLoading) {
                    return Container(
                      color: Colors.black,
                    );
                  } else if (state is BreakingNewsLoadedSuccess) {
                    final _filterSingleBreakingNews =
                        state.breakingNewsArticles.first;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                        image: state.breakingNewsArticles.first.urlImage != null
                            ? DecorationImage(
                                fit: BoxFit.fill,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white12, BlendMode.lighten),
                                image: NetworkImage(
                                    _filterSingleBreakingNews.urlImage!),
                              )
                            : null,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
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
                                            .subtitle1
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
                              style: textTheme.headline5?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                  } else if (state is BreakingNewsFailed) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),

            /// Breaking news content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Breaking News',
                      style: textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
                      builder: (context, state) {
                        if (state is BreakingNewsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is BreakingNewsLoadedSuccess) {
                          final _filteredBreakingNews = state
                              .breakingNewsArticles
                              .getRange(1, 5)
                              .toList();
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: _filteredBreakingNews.length,
                            itemBuilder: (context, index) {
                              return LimitedBox(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      /// Image
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              image:
                                                  _filteredBreakingNews[index]
                                                              .urlImage !=
                                                          null
                                                      ? DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              _filteredBreakingNews[
                                                                      index]
                                                                  .urlImage!),
                                                        )
                                                      : null,
                                            ),
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          _filteredBreakingNews[index].title ??
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
                                              durationTimer(
                                                  _filteredBreakingNews[index]
                                                      .publishedAt),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(_filteredBreakingNews[index]
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
                        } else if (state is BreakingNewsFailed) {
                          return Center(
                            child: Text(state.error),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

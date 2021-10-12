import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';
import 'package:portal_berita_indonesia/home/widgets/news_content.dart';
import 'package:portal_berita_indonesia/home/widgets/news_header.dart';
import 'package:portal_berita_indonesia/saved/bloc/saved_news_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreakingNewsBloc>(
          create: (_) =>
              BreakingNewsBloc(newsRepository: context.read<NewsRepository>())
                ..add(BreakingNewsFetched()),
        ),
        BlocProvider(
          create: (_) => SavedNewsBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            /// Header News
            BreakingNewsHeader(textTheme: textTheme),

            /// Breaking news contents
            BreakingNewsContent(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}

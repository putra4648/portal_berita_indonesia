// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/category/bloc/news_category_bloc.dart';
import 'package:portal_berita_indonesia/detail/bloc/recommendation_news_bloc.dart';
import 'package:portal_berita_indonesia/detail/view/detail.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';
import 'package:portal_berita_indonesia/home/home.dart';
import 'package:portal_berita_indonesia/injection_container.dart';
import 'package:portal_berita_indonesia/l10n/l10n.dart';
import 'package:portal_berita_indonesia/saved/bloc/saved_news_bloc.dart';
import 'package:portal_berita_indonesia/saved/saved.dart';
import 'package:portal_berita_indonesia/search/bloc/search_news_bloc.dart';
import 'package:portal_berita_indonesia/search/search.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<NewsRepository>(
      create: (_) => services<NewsRepository>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => services<BreakingNewsBloc>(),
          ),
          BlocProvider(
            create: (_) => services<SavedNewsBloc>(),
          ),
          BlocProvider(
            create: (_) => services<NewsCategoryBloc>(),
          ),
          BlocProvider(
            create: (_) => services<SearchNewsBloc>(),
          ),
          BlocProvider(
            create: (_) => services<RecommendationNewsBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Portal Berita',
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          onGenerateRoute: (settings) {
            if (settings.name == Detail.route) {}
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text('Hello guys Radal here'),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border), label: ''),
              ],
            ),
            body: [
              const Home(),
              const Search(),
              const Saved(),
            ].elementAt(currentIndex),
          ),
        ),
      ),
    );
  }
}

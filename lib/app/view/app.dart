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

import 'package:portal_berita_indonesia/home/home.dart';
import 'package:portal_berita_indonesia/l10n/l10n.dart';
import 'package:portal_berita_indonesia/profile/profile.dart';
import 'package:portal_berita_indonesia/search/search.dart';

class App extends StatefulWidget {
  const App({Key? key, required NewsRepository newsRepository})
      : _newsRepository = newsRepository,
        super(key: key);

  final NewsRepository _newsRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<NewsRepository>(
      create: (_) => widget._newsRepository,
      child: MaterialApp(
        title: 'Portal Berita',
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(
            // primaryColor: Colors.white,
            // canvasColor: Colors.white,
            // visualDensity: VisualDensity.compact,
            // colorScheme: const ColorScheme.light(
            //   primary: Colors.white,
            // ),
            // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            //   selectedItemColor: Colors.black,
            // ),
            // textButtonTheme: TextButtonThemeData(
            //   style: TextButton.styleFrom(
            //     primary: Colors.black,
            //     padding: EdgeInsets.zero,
            //   ),
            // ),
            // inputDecorationTheme: InputDecorationTheme(
            //   filled: true,
            //   fillColor: Colors.grey.shade100,
            //   focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: BorderSide.none,
            //   ),
            //   border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: BorderSide.none,
            //   ),
            //   enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: BorderSide.none,
            //   ),
            //   errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: BorderSide.none,
            //   ),
            // ),
            ),
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
            currentIndex: _currentIndex,
            onTap: (index) {
              _currentIndex = index;
              setState(() {});
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
          body: [const Home(), const Search(), const Profile()]
              .elementAt(_currentIndex),
        ),
      ),
    );
  }
}

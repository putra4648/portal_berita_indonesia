import 'package:flutter/material.dart';

import 'package:portal_berita_indonesia/home/widgets/news_content.dart';
import 'package:portal_berita_indonesia/home/widgets/news_header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_berita_indonesia/home/bloc/breaking_news_bloc.dart';
import 'package:portal_berita_indonesia/home/widgets/news_content.dart';
import 'package:portal_berita_indonesia/home/widgets/news_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<BreakingNewsBloc>().add(BreakingNewsFetched());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<BreakingNewsBloc>().add(BreakingNewsRefresh());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              /// Header News
              BreakingNewsHeader(textTheme: textTheme),

              /// Breaking news contents
              BreakingNewsContent(textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}

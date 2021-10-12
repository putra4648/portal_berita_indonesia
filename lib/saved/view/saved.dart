import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_berita_indonesia/saved/bloc/saved_news_bloc.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SavedNewsBloc, SavedNewsState>(
        bloc: SavedNewsBloc(),
        builder: (context, state) {
          if (state.savedArticles.isEmpty) {
            return const Center(
              child: Text('Belum ada data'),
            );
          }
          return ListView.builder(
            itemCount: state.savedArticles.length,
            itemBuilder: (context, index) {
              final article = state.savedArticles[index];
              return ListTile(
                title: Text(article.title ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}

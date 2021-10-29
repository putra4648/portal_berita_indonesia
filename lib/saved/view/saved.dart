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
      body: SafeArea(
        child: BlocBuilder<SavedNewsBloc, SavedNewsState>(
          builder: (context, state) {
            if (state.savedArticles.isEmpty) {
              return const Center(
                child: Text('Belum ada data'),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.savedArticles.length,
              itemBuilder: (context, index) {
                final article = state.savedArticles[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      if (article.urlImage != null)
                        Image.network(
                          article.urlImage!,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ListTile(
                        title: Text(
                          article.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<SavedNewsBloc>()
                                .add(SavedNewsDeleted(article: article));
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

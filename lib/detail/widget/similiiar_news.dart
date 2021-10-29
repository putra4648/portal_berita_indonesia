import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/detail/bloc/recommendation_news_bloc.dart';
import 'package:portal_berita_indonesia/detail/view/detail.dart';

class SimilliarNews extends StatelessWidget {
  const SimilliarNews({
    Key? key,
    required this.page,
  }) : super(key: key);

  final int page;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height / 3,
      child: BlocBuilder<RecommendationNewsBloc, RecommendationNewsState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.recommendedArticles.length,
            itemBuilder: (context, index) {
              return LimitedBox(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
                    final pagePopped = await Navigator.of(context)
                        .push<Widget>(MaterialPageRoute(
                            settings: RouteSettings(arguments: page + 5),
                            builder: (context) {
                              return Detail(
                                article: state.recommendedArticles[index],
                                page: page + 5,
                              );
                            }));
                    debugPrint(pagePopped.toString());
                  },
                  child: Column(
                    children: [
                      /// News Image
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: state.recommendedArticles[index].urlImage !=
                                    null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(state
                                        .recommendedArticles[index].urlImage!),
                                  )
                                : null,
                          ),
                          width: double.infinity,
                        ),
                      ),

                      /// News Title
                      ListTile(
                        title: Text(
                          state.recommendedArticles[index].title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.subtitle1
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        isThreeLine: true,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              durationTimer(
                                  state.recommendedArticles[index].publishedAt),
                            ),
                            const SizedBox(height: 5),
                            Text(state.recommendedArticles[index].author ?? '')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

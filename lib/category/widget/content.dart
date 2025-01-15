import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/category/bloc/news_category_bloc.dart';
import 'package:portal_berita_indonesia/detail/view/detail.dart';

class TabBarViewContent extends StatelessWidget {
  const TabBarViewContent({
    Key? key,
    required TabController tabController,
    required this.textTheme,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: CategoryType.values
            .map<Widget>(
              (category) => BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
                builder: (context, state) {
                  if (state is NewsCategoryLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (state is NewsCategoryLoadedSuccess) {
                    return ListView.builder(
                      itemCount: state.categoryArticles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push<Widget>(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Detail(
                                      article: state.categoryArticles[index],
                                      page: index + 5);
                                },
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: state.categoryArticles[index]
                                                .urlImage !=
                                            null
                                        ? Image.network(
                                            state.categoryArticles[index]
                                                .urlImage!,
                                            fit: BoxFit.fill,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.categoryArticles[index].title ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Chip(
                                      avatar: const Icon(Icons.timer),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      label: Text(
                                        durationTimer(state
                                            .categoryArticles[index]
                                            .publishedAt),
                                        style: textTheme.bodySmall,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is NewsCategoryFailed) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

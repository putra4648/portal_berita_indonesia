import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/search/bloc/news_category_bloc.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: CategoryType.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider<NewsCategoryBloc>(
      create: (_) =>
          NewsCategoryBloc(newsRepository: context.read<NewsRepository>())
            ..add(const NewsCategoryChanged(
                countryCode: CountryCode.id,
                categoryType: CategoryType.business)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temukan',
                      style: textTheme.headline3?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Berita favoritmu di sini',
                      style: textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsetsDirectional.only(start: 12),
                      child: Icon(Icons.search_outlined),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.settings_input_composite),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Cari beritamu',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Builder(builder: (context) {
                return TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  labelStyle: textTheme.headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                  physics: const BouncingScrollPhysics(),
                  tabs: CategoryType.values
                      .map((category) => Tab(
                            child: Text(mappingCategoryToString(category)[0]
                                    .toUpperCase() +
                                mappingCategoryToString(category).substring(1)),
                          ))
                      .toList(),
                  onTap: (index) {
                    context.read<NewsCategoryBloc>().add(NewsCategoryChanged(
                        countryCode: CountryCode.id,
                        categoryType: CategoryType.values[index]));
                    debugPrint(
                        mappingCategoryToString(CategoryType.values[index]));
                  },
                );
              }),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const BouncingScrollPhysics(),
                  children: CategoryType.values
                      .map(
                        (category) =>
                            BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
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
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child:
                                                  state.categoryArticles[index]
                                                              .urlImage !=
                                                          null
                                                      ? Image.network(
                                                          state
                                                              .categoryArticles[
                                                                  index]
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.categoryArticles[index]
                                                        .title ??
                                                    '',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: textTheme.subtitle1
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Chip(
                                                avatar: const Icon(Icons.timer),
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                                label: Text(
                                                  durationTimer(state
                                                      .categoryArticles[index]
                                                      .publishedAt),
                                                  style: textTheme.caption,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/search/bloc/news_category_bloc.dart';
import 'package:portal_berita_indonesia/search/widgets/content.dart';
import 'package:portal_berita_indonesia/search/widgets/custom_tab_bar.dart';
import 'package:portal_berita_indonesia/search/widgets/label.dart';
import 'package:portal_berita_indonesia/search/widgets/search_bar.dart';

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
              BuildLabel(textTheme: textTheme),
              const SearchBar(),
              CustomTabBar(tabController: _tabController, textTheme: textTheme),
              TabBarViewContent(
                tabController: _tabController,
                textTheme: textTheme,
              )
            ],
          ),
        ),
      ),
    );
  }
}

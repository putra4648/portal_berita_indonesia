import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/category/bloc/news_category_bloc.dart';
import 'package:portal_berita_indonesia/category/category.dart';
import 'package:portal_berita_indonesia/search/widgets/label.dart';
import 'package:portal_berita_indonesia/search/widgets/search_bar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCategoryBloc>().add(const NewsCategoryChanged(
        countryCode: CountryCode.id, categoryType: CategoryType.business));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildLabel(textTheme: textTheme),
              const SearchBar(),
              const Category()
            ],
          ),
        ),
      ),
    );
  }
}

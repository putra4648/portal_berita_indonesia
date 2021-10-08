import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/search/bloc/news_category_bloc.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required TabController tabController,
    required this.textTheme,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: Colors.black,
        labelStyle: textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
        physics: const BouncingScrollPhysics(),
        tabs: CategoryType.values
            .map((category) => Tab(
                  child: Text(
                      mappingCategoryToString(category)[0].toUpperCase() +
                          mappingCategoryToString(category).substring(1)),
                ))
            .toList(),
        onTap: (index) {
          context.read<NewsCategoryBloc>().add(NewsCategoryChanged(
              countryCode: CountryCode.id,
              categoryType: CategoryType.values[index]));
          debugPrint(mappingCategoryToString(CategoryType.values[index]));
        },
      );
    });
  }
}

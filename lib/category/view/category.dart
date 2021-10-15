import 'package:flutter/material.dart';
import 'package:news_repository/news_repository.dart';
import 'package:portal_berita_indonesia/category/widget/content.dart';
import 'package:portal_berita_indonesia/category/widget/custom_tab_bar.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  late final _tabController =
      TabController(length: CategoryType.values.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CustomTabBar(tabController: _tabController, textTheme: textTheme),
        TabBarViewContent(
          tabController: _tabController,
          textTheme: textTheme,
        )
      ],
    );
  }
}

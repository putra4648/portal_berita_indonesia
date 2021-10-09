import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _searchTextController;
  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: _searchTextController,
        onSubmitted: (value) async {
          final search = await showSearch<String>(
            context: context,
            query: value,
            delegate: CustomSearchDelegate(),
          );
          debugPrint(search.toString());
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Padding(
            padding: EdgeInsetsDirectional.only(start: 12),
            child: Icon(Icons.search_outlined),
          ),
          hintText: 'Cari beritamu',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.settings_input_composite,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: List.generate(
          query.length,
          (index) => ListTile(
                title: Text('Index ke $index'),
              )),
    );
  }

  /// Will not be used for make suggestion
  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}

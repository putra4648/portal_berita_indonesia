import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portal_berita_indonesia/search/bloc/search_news_bloc.dart';

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
        onSubmitted: (value) {
          context
              .read<SearchNewsBloc>()
              .add(SearchNewsQueryChanged(query: value));
          showSearch<String>(
            context: context,
            query: value,
            delegate: CustomSearchDelegate(context.read<SearchNewsBloc>()),
          );
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
  CustomSearchDelegate(this.seachNewsbloc);

  final Bloc<SearchNewsEvent, SearchNewsState> seachNewsbloc;
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
    seachNewsbloc.add(SearchNewsQueryChanged(query: query));
    return BlocBuilder(
      bloc: seachNewsbloc,
      builder: (BuildContext context, SearchNewsState state) {
        if (state is SearchNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchNewsLoadedSuccess) {
          return ListView.builder(
            itemCount: state.newsResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.newsResults[index].title ?? ''),
              );
            },
          );
        } else if (state is SearchNewsFailed) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  /// Will not be used for make suggestion
  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}

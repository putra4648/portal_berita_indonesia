import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
            Text(
              'Temukan',
              style: textTheme.headline3
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Berita di seluruh ASEAN',
              style: textTheme.caption,
            ),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                border: InputBorder.none,
                hintText: 'Cari',
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}

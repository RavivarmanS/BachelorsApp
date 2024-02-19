import 'package:flutter/material.dart';
class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search_outlined),
      trailing: <Widget>[
        IconButton(
          icon: Icon(Icons.filter_alt_outlined),
          onPressed: null,
        )
      ],
    );
  }
}
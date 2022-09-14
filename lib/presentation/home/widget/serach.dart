import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:student/infrastructure/data_function/function.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('data'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listItems = query.isEmpty
        ? studentValueNotifier.value
        : studentValueNotifier.value
            .where((item) => item.studentName!
                .toLowerCase()
                .startsWith(query.toLowerCase().toString()))
            .toList();
    log(listItems.toString());
    return const Scaffold();
  }
}

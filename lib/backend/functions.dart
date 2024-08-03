import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:techdev/components/searchbar.dart';

Future<List> fetchNews() async {
  print(SearchBox.searchController.text);
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=4f834a3abe1b4af0a3af48d4958782fe&q='+SearchBox.searchController.text));

  Map result = jsonDecode(response.body);
  print(SearchBox.searchController);
  print('fetched');
  return result['articles'];
}

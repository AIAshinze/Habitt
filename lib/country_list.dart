// country_list.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api_config.dart';

Future<List<String>> fetchCountries() async {
  final List<String> allCountries = [];
  int offset = 0;
  const limit = 100;
  bool hasMore = true;

  while (hasMore) {
    final uri = Uri.parse(
      '${ApiConfig.countriesBaseUrl}?response_fields=names.common&limit=$limit&offset=$offset',
    );

    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${ApiConfig.countriesApiKey}'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load countries: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);
    final countryList = json['data']?['objects'] as List? ?? [];

    for (final country in countryList) {
      final name = country['names']?['common'] as String?;
      if (name != null && name.isNotEmpty) {
        allCountries.add(name);
      }
    }

    final meta = json['meta'];
    hasMore = meta?['more'] == true;
    offset += limit;
  }

  allCountries.sort();
  return allCountries;
}

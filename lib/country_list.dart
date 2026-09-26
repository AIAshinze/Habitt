// country_list.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api_config.dart';

Future<List<String>> fetchCountries() async {
  final uri = Uri.parse(
    '${ApiConfig.countriesBaseUrl}?response_fields=names.common',
  );

  final response = await http.get(
    uri,
    headers: {'Authorization': 'Bearer ${ApiConfig.countriesApiKey}'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load countries: ${response.statusCode}');
  }

  final json = jsonDecode(response.body);
  final countryList = json['data']['objects'] as List;

  return countryList
      .map((country) => country['names']['common'] as String)
      .toList();
}

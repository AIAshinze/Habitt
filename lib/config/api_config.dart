class ApiConfig {
  static const countriesApiKey = String.fromEnvironment(
    'REST_COUNTRIES_API_KEY',
  );

  static const countriesBaseUrl = 'https://api.restcountries.com/countries/v5';
}

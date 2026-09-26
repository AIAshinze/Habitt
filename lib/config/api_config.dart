class ApiConfig {
  static const countriesApiKey = String.fromEnvironment(
    'REST_COUNTRIES_API_KEY',
    defaultValue: 'rc_live_d2af13a275bf4f209296e96c786ed11b',
  );

  static const countriesBaseUrl = 'https://api.restcountries.com/countries/v5';
}

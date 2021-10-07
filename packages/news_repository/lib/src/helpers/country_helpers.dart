import 'package:news_repository/src/enums/enums.dart';

/// Return [String] country code based on [countryCode] args
String mappingCountryToString(CountryCode countryCode) {
  switch (countryCode) {
    case CountryCode.sg:
      return 'sg';
    case CountryCode.id:
      return 'id';
    case CountryCode.th:
      return 'th';
    case CountryCode.ph:
      return 'ph';
    case CountryCode.my:
      return 'my';
  }
}

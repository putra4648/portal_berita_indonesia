import 'package:news_repository/src/enums/enums.dart';

/// Return [String] country code based on [category] args
String mappingCategoryToString(CategoryType category) {
  switch (category) {
    case CategoryType.business:
      return 'business';
    case CategoryType.entertainment:
      return 'entertainment';
    case CategoryType.general:
      return 'general';
    case CategoryType.health:
      return 'health';
    case CategoryType.science:
      return 'science';
    case CategoryType.sports:
      return 'sports';
    case CategoryType.technology:
      return 'technology';
  }
}

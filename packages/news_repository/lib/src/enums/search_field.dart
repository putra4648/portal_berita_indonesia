/// Search field enumeration type for search_fields
enum SearchField {
  /// title
  title('title'),

  /// description
  description('description'),

  /// keywords
  keywords('keywords'),

  /// main_text
  mainText('main_text');

  /// {macro search_field}
  const SearchField(this.value);

  /// Enum actual value
  final String value;
}

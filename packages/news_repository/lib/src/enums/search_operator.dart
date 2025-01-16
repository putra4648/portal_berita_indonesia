/// Search Operator enum
enum SearchOperator {
  /// use +
  and('+'),

  /// use |
  or('|'),

  /// use -
  negate('-'),

  /// use *
  prefix('*');

  const SearchOperator(this.value);

  /// Enum actual value
  final String value;
}

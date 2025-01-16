/// date_field enumeration type
enum DateField {
  /// date format yyyy-MM-dd;
  fullDate('yyyy-MM-dd'),

  /// date format only year and month;
  yearAndMonth('yyyy-MM'),

  /// date format only year ;
  year('yyyy');

  const DateField(this.value);

  /// Enum actual value
  final String value;
}

DateTime fromGraphQLtimestamptzToDateTime(String timestamptz) =>
    DateTime.parse(timestamptz);

String fromDartDateTimeToGraphQLtimestamptz(DateTime date) =>
    date.toIso8601String();

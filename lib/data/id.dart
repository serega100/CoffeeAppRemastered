class Id<T> {
  final String sourceId;
  final Object value;

  Id({
    required this.sourceId,
    required this.value,
  });

  Type get type => T.runtimeType;

  Id.fromLocalJson(dynamic json)
      : this(
          sourceId: json["sourceId"] as String,
          value: json["value"],
        );

  dynamic toLocalJson() {
    var jsonMap = <String, dynamic>{
      "sourceId": sourceId,
      "type": T.runtimeType.toString(),
      "value": value.toString()
    };
    return jsonMap;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Id &&
          runtimeType == other.runtimeType &&
          sourceId == other.sourceId &&
          value == other.value;

  @override
  int get hashCode => sourceId.hashCode ^ value.hashCode;
}

class Id<T> {
  final String sourceId;
  final Object value;

  Id({
    required this.sourceId,
    required this.value,
  });

  Type get type => T.runtimeType;

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

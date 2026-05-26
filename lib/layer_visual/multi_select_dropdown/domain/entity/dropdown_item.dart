class DropdownItem<T> {
  final T value;
  final String label;
  final String chipLabel;
  final bool isSelected;

  const DropdownItem({
    required this.value,
    required this.label,
    this.isSelected = false,
    String? chipLabel,
  }) : chipLabel = chipLabel ?? label;

  DropdownItem<T> copyWith({
    T? value,
    String? label,
    String? chipLabel,
    bool? isSelected,
  }) {
    return DropdownItem<T>(
      value: value ?? this.value,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      chipLabel: chipLabel ?? this.chipLabel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownItem<T> && other.value == this.value;

  @override
  int get hashCode => value.hashCode;
}

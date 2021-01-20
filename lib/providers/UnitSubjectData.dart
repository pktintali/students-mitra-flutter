class UnitSubjectData {

  final String shortName;
  final String fullName;
  final bool isSelected;

  UnitSubjectData({
    this.shortName,
    this.fullName,
    this.isSelected=false,
  });

  UnitSubjectData copyWith({
    String shortName,
    String fullName,
    bool isSelected=false,
  }) {
    return UnitSubjectData(
      shortName: shortName ?? this.shortName,
      fullName: fullName ?? this.fullName,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

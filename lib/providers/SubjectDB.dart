class SubjectDB {
  final String id;
  final String shortName;
  final String fullName;
  final String type;
  final int randLimit;
  final double time;
  final int noOfQue;
  SubjectDB({
    this.id,
    this.shortName,
    this.fullName,
    this.type,
    this.randLimit,
    this.time,
    this.noOfQue,
  });

  SubjectDB copyWith({
    String id,
    String shortName,
    String fullName,
    String type,
    int randLimit,
    double time,
    int noOfQue,
  }) {
    return SubjectDB(
      id: id ?? this.id,
      shortName: shortName ?? this.shortName,
      fullName: fullName ?? this.fullName,
      type: type ?? this.type,
      randLimit: randLimit ?? this.randLimit,
      time: time ?? this.time,
      noOfQue: noOfQue ?? this.noOfQue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shortName': shortName,
      'fullName': fullName,
      'type': type,
      'randLimit': randLimit,
      'time': time,
      'noOfQue': noOfQue,
    };
  }

  factory SubjectDB.fromList(List<dynamic> i) {
    if (i == null) return null;
    return SubjectDB(
      id: i[0] ?? 'id',
      fullName: i[1],
      shortName: i[2],
      type: i[3],
      randLimit: int.parse(i[4]),
      // time: double.parse(i[5]),
      // noOfQue: int.parse(i[6]),
    );
  }

  factory SubjectDB.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    print(map['values'][0]);
    return SubjectDB(
      id: map['id'],
      shortName: map['shortName'],
      fullName: map['fullName'],
      type: map['type'],
      randLimit: map['randLimit'],
      time: map['time'],
      noOfQue: map['noOfQue'],
    );
  }
}

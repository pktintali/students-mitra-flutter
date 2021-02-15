class QuestionsDB {
  final String question;
  final String opt1;
  final String opt2;
  final String opt3;
  final String opt4;
  final String ans;
  QuestionsDB({
    this.question,
    this.opt1,
    this.opt2,
    this.opt3,
    this.opt4,
    this.ans,
  });

  QuestionsDB copyWith({
    String question,
    String opt1,
    String opt2,
    String opt3,
    String opt4,
    String ans,
  }) {
    return QuestionsDB(
      question: question ?? this.question,
      opt1: opt1 ?? this.opt1,
      opt2: opt2 ?? this.opt2,
      opt3: opt3 ?? this.opt3,
      opt4: opt4 ?? this.opt4,
      ans: ans ?? this.ans,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'opt1': opt1,
      'opt2': opt2,
      'opt3': opt3,
      'opt4': opt4,
      'ans': ans,
    };
  }

  factory QuestionsDB.fromList(List<dynamic> i) {
    if (i == null) return null;

    return QuestionsDB(
      question: i[1],
      opt1: i[2],
      opt2: i[3],
      opt3: i[4],
      opt4: i[5],
      ans: i[6],
    );
  }
}

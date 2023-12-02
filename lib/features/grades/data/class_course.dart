class ClassCourse {
  final String? name;
  final String? grade;
  final String? description;
  final int? quizzes;
  final int? midterm;
  final int? homeworks;
  final int? finals;

  ClassCourse({
    this.name,
    this.grade,
    this.description,
    this.quizzes,
    this.midterm,
    this.homeworks,
    this.finals,
  });
  get getGrade => grade;
  get getDescription => description;
  get getQuizzes => quizzes;
  get getMidterm => midterm;
  get getHomeworks => homeworks;
  get getFinals => finals;
  get getName => name;
}

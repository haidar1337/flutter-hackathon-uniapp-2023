class ExamData {
  final String courseId;
  final String courseName;
  final String time;
  final String date;
  final String day;
  final String location;

  ExamData({
    required this.courseId,
    required this.courseName,
    required this.time,
    required this.date,
    required this.day,
    required this.location,
  });

  factory ExamData.fromJson(Map<String, dynamic> json) {
    return ExamData(
      courseId: json['courseId'],
      courseName: json['courseName'],
      time: json['time'],
      date: json['date'],
      day: json['day'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'courseName': courseName,
      'time': time,
      'date': date,
      'day': day,
      'location': location,
    };
  }
}

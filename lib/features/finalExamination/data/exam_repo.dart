import 'package:http/http.dart' as http;

class ExamRepo {
  static Future<String> getExams() async {
    var url = Uri.parse('https://exam-tracker.vercel.app/api/data');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }
}

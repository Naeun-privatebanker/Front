import 'package:naeun_front/models/quiz_item.dart';

class QuizResult {
  final String date;
  final String title;
  final String time;
  final int quizResultPercent;
  final String quizResultState;
  final int quizResultCount;
  final List<QuizItem> quizItem;

  QuizResult({
    required this.date,
    required this.title,
    required this.time,
    required this.quizResultPercent,
    required this.quizResultState,
    required this.quizResultCount,
    required this.quizItem,
  });
}

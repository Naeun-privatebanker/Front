import 'package:flutter/material.dart';
import 'package:naeun_front/screens/record/record_quiz_screen.dart';

class RecordTabQuizItem extends StatelessWidget {
  final String title;
  final bool isQuizDone;
  final int understand;
  final String quizLabel;

  const RecordTabQuizItem({
    Key? key,
    required this.title,
    required this.isQuizDone,
    required this.understand,
    required this.quizLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecordQuiz(title: title),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 24, left: 24, bottom: 12),
        padding: EdgeInsets.only(right: 16, left: 24, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 4),
                  if (isQuizDone)
                    Text(
                      '아직 문제를 풀지 않았어요', // '퀴즈 완료'로 대체
                      style: TextStyle(
                        color: Color(0xFF0045FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    )
                  else
                    Row(
                      children: [
                        Text(
                          '이해도: $understand% · ',
                          style: TextStyle(
                            color: understand <= 50
                                ? Color(0xFFFF0001)
                                : Color(0xFF565D66),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          quizLabel,
                          style: TextStyle(
                            color: understand <= 50
                                ? Color(0xFFFF0001)
                                : Color(0xFF565D66),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isQuizDone ? Color(0xFFE8F3FF) : Color(0xFFFFF1F1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Text(
                isQuizDone ? '퀴즈풀기' : '결과보기',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: isQuizDone ? Color(0xFF3168FD) : Color(0xFFFE3A3B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
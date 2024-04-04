import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naeun_front/models/quiz_result.dart';

import '../../models/quiz_item.dart';

class RecordQuizResultScreenItem extends StatelessWidget {
  final QuizResult quizResult;
  final int quizResultPercent;

  const RecordQuizResultScreenItem(
      {Key? key, required this.quizResult, required this.quizResultPercent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: quizResult.quizItem.length,
      itemBuilder: (context, index) {
        final QuizItem item = quizResult.quizItem[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index != 0) ...[
                Container(
                  height: 2,
                  color: Color(0xFFD9D9D9),
                  width: double.infinity,
                ),
                SizedBox(height: 27),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  'Q${index + 1}. ${item.quiz}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF353535),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: item.answerBold,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: quizResultPercent <= 50
                              ? Color(0xFFFE3A3B)
                              : Color(0xFF3168FD),
                        ),
                      ),
                      TextSpan(
                        text: item.answerLight,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: quizResultPercent <= 50
                              ? Color(0xFFFE3A3B)
                              : Color(0xFF3168FD),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  '내 오답: ${item.unCorrect}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF697481),
                  ),
                ),
              ),
              SizedBox(height: 28),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naeun_front/models/quiz_result.dart';
import 'package:naeun_front/screens/record/record_quiz_result_screen_item.dart';

import '../../models/quiz_item.dart';

class RecordQuizResult extends StatefulWidget {
  final String title;

  RecordQuizResult({required this.title});

  @override
  _RecordQuizResultState createState() => _RecordQuizResultState();
}

class _RecordQuizResultState extends State<RecordQuizResult> {
  QuizResult quizResult = QuizResult(
    date: '2024.04.11',
    title: '국민은행 KB albe ELS',
    time: '48',
    quizResultPercent: 33,
    quizResultState: '주의',
    quizResultCount: 2,
    quizItem: [
      QuizItem(
        quiz: '본상품은 예·적금과는 다른상품으로 예금자 보호를 받지 못해 원금손실위험이 있다.',
        answerBold: '있다. ',
        answerLight:
        'ELS 상품은 예금이나 적금과 같은 예금자보호 대상 상품이 아닙니다. 따라서 기초자산 가격 변동에 따라 원금 손실이 발생할 수 있습니다.',
        unCorrect: '아니에요',
      ),
      QuizItem(
        quiz: '“고객님 이 상품은 원금 손실 될 확률이 거의 없어요.”',
        answerBold: '원금의 20%~100%(원금전액). ',
        answerLight:
        '본 상품은 기초자산 가격이 크게 하락하는 경우에는 원금 손실이 발생할 수 있으며, 최악의 경우 원금 전액을 잃을 수도 있습니다.',
        unCorrect: '원금의 0%~20%',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: quizResult.quizResultPercent <= 50
                  ? Color(0xFFFE3A3B)
                  : Color(0xFF3168FD),
              padding: EdgeInsets.only(top: 47),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/ic_record_back.svg',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: quizResult.quizResultPercent <= 50
                          ? Color(0xFFFE3A3B)
                          : Color(0xFF3168FD),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(height: 28),
                          Row(
                            children: [
                              Text(
                                quizResult.date,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(width: 16),
                              Text(
                                quizResult.title,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(width: 16),
                              Text(
                                ' · ${quizResult.time} 분',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: AssetImage(
                                    'assets/png/img_record_result_profile.png'),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '이해도 ${quizResult.quizResultPercent}% · ${quizResult.quizResultState}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(top: 34),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  quizResult.quizResultPercent <= 50
                                      ? 'assets/png/img_record_quiz_red.png'
                                      : 'assets/png/img_record_quiz_blue.png',
                                  width: 60,
                                  height: 60,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  '오답이 ${quizResult.quizResultCount}개 있어요!',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: quizResult.quizResultPercent <= 50
                                        ? Color(0xFFFE3A3B)
                                        : Color(0xFF3168FD),
                                  ),
                                ),
                                RecordQuizResultScreenItem(
                                    quizResult: quizResult,
                                    quizResultPercent:
                                    quizResult.quizResultPercent),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            '※ 해당 퀴즈는 금융사 완전판매 모니터링 문제와 녹음본 주의사항을 종합하여 제작됩니다.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF878787),
                            ),
                          ),
                          SizedBox(height: 28),
                          Container(
                            height: 3,
                            color: Color(0xFFF2F4F6),
                            width: double.infinity,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(height: 28),
                          Text(
                            '상담내용을 더 자세히 보고싶다면?',
                            style: TextStyle(
                              color: Color(0xFF353535),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.only(
                                left: 12, right: 16, top: 12, bottom: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Add your onPressed logic here
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/ic_record_quiz_list.svg',
                                        fit: BoxFit.cover,
                                        semanticsLabel: 'Record Icon',
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '녹음 기록지 보러가기',
                                        style: TextStyle(
                                          color: Color(0xFF565D66),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/ic_record_quiz_detail.svg',
                                    fit: BoxFit.cover,
                                    semanticsLabel: 'Go to record',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 160),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
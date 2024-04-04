import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/record_result.dart';

class RecordQuiz extends StatefulWidget {
  final String title;

  RecordQuiz({required this.title});

  @override
  _RecordFeatureResultState createState() => _RecordFeatureResultState();
}

class _RecordFeatureResultState extends State<RecordQuiz> {
  RecordResult recordResult = RecordResult(
    date: '2024.04.11',
    title: '국민은행 KB albe ELS',
    time: '48',
    count: '3',
    itemList: [
      '“고객님 이 상품은 원금 손실 될 확률이 거의 없어요.”',
      '“고객님 이 상품은 원금 손실 될 확률이 거의 없어요.”',
      '“고객님 이 상품은 원금 손실 될 확률이 거의 없어요.”'
    ],
    fullText:
    '우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: Color(0xFF2661FF),
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
                      color: Color(0xFF2661FF),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(height: 28),
                          Row(
                            children: [
                              Text(
                                recordResult.date,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(width: 16),
                              Text(
                                recordResult.title,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(width: 16),
                              Text(
                                ' · ${recordResult.time} 분',
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
                                '문제를 풀어보세요!',
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
                            padding: EdgeInsets.symmetric(vertical: 34),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F4F6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/png/img_record_quiz_naeun.png',
                                ),
                                SizedBox(height: 16),
                                Text(
                                  '상품을 제대로\n이해했는지 확인해볼까요?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF565D66),
                                  ),
                                ),
                                SizedBox(height: 18),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      '퀴즈 풀러가기',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFF3168FD),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 13,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 11),
                                Text(
                                  '총 3문제',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF565D66),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),
                          Text(
                            '※ 해당 퀴즈는 금융사 완전판매 모니터링 문제와 녹음본 주의사항을 종합하여 제작됩니다.',
                            textAlign: TextAlign.center,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naeun_front/screens/record/record_feature_download_popup.dart';
import 'package:naeun_front/screens/record/record_feature_wrong_popup.dart';

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
        '우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(
                                '전체 대화내용',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 16),
                              Text(
                                recordResult.fullText,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 26),
                              Container(
                                height: 3,
                                color: Color(0xFFF2F4F6),
                                width: double.infinity,
                              ),
                              SizedBox(height: 32),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0x80D9D9D9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

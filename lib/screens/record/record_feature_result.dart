import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naeun_front/screens/record/record_feature_download_popup.dart';

import '../../models/record_result.dart';

class RecordFeatureResult extends StatefulWidget {
  final String title;
  RecordFeatureResult({required this.title});

  @override
  _RecordFeatureResultState createState() => _RecordFeatureResultState();
}

class _RecordFeatureResultState extends State<RecordFeatureResult> {
  final ValueNotifier<bool> _listening = ValueNotifier<bool>(false);

  int _currentPageIndex = 0; // 현재 페이지 인덱스를 저장하는 변수

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
                  color: Color(0xFFFF4041),
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecordDownloadPopup(
                                  date: recordResult.date,
                                  title: recordResult.title,
                                  time: recordResult.date,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ShaderMask(
                                blendMode: BlendMode.srcATop,
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    colors: [
                                      Color(0xFFFFFFFF), // Start color
                                      Color(0xFFFFFFFF).withOpacity(0.6), // End color
                                    ],
                                    begin: Alignment.topCenter, // 100% at the left
                                    end: Alignment.bottomCenter, // 0% at the right
                                  ).createShader(bounds);
                                },
                                child: SvgPicture.asset(
                                  'assets/svg/ic_record_download.svg',
                                  color: Colors.white, // Color of the SVG image
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '다운로드',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 24),
                            ],
                          ),
                        ),
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
                          color: Color(0xFFFF4041),
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
                                    '오안내 의심표현 ${recordResult.count}개',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32),
                              Container(
                                height: 130,
                                child: PageView.builder(
                                  onPageChanged: (int index) {
                                    setState(() {
                                      _currentPageIndex = index;
                                    });
                                  },
                                  itemCount: recordResult.itemList.length,
                                  itemBuilder: (context, index) {
                                    return buildPageViewItem(
                                        recordResult.itemList[index]);
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                      (index) => buildIndicator(index),
                                ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/ic_record_question.svg',
                                      fit: BoxFit.cover,
                                      semanticsLabel: 'Question Icon',
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '이해도퀴즈 풀러가기',
                                      style: TextStyle(
                                        color: Color(0xFF565D66),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 146,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              right: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'assets/svg/ic_record_floating_background.svg',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog.fullscreen(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: _naeunDialog(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), // 버튼을 원 모양으로 만듦
                      padding: EdgeInsets.all(0), // 내부 padding 추가
                      backgroundColor: Color(0xFFFE3A3B), // 배경색 설정
                      elevation: 5, // 그림자 높이 설정
                    ),
                    child: Image.asset(
                      'assets/png/img_record_floating.png',
                      width: 78, // 이미지의 너비
                      height: 78,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageViewItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 23),
      margin: EdgeInsets.only(top: 16, right: 9),
      decoration: BoxDecoration(
        color: Color(0xFFF2F4F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline),
        softWrap: true,
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: index == _currentPageIndex ? 20 : 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: index == _currentPageIndex ? Colors.white : Color(0xFFD9D9D9),
      ),
    );
  }

  Widget _naeunDialog() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            // 뒤로가기 아이콘
            SizedBox(height: 5, width: MediaQuery.of(context).size.width),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 1. 텍스트
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.multitrack_audio,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width *
                      0.1, // 아이콘 크기를 화면 너비의 10%로 설정
                ),
                const SizedBox(height: 10),
                Text(
                  '오안내 의심표현을',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '함께 확인해봐요',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),

        // 2. 그림 덩어리
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            // 나은이 이미지
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 282,
                height: 520,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/speaking_naeun.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              bottom: 80,
              child: ValueListenableBuilder<bool>(
                  valueListenable: _listening,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _listening.value
                              ? Colors.transparent
                              : const Color(0xffFE3A3B),
                          minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 55),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: 1.0,
                                color: _listening.value ?
                                const Color(0x00fff4f6).withOpacity(0.4)
                                    : Colors.transparent,
                              )
                          )),
                      onPressed: () {
                        setState(() {
                          _listening.value = !_listening.value; // 상태를 토글합니다.
                          print('상태변경!');
                          print(_listening.value);
                        });
                      },
                      child: Center(
                        child: Text(
                          _listening.value ? '그만 듣기' : '설명 듣기',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        )
      ],
    );
  }
}
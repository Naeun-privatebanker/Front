import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naeun_front/screens/record/record_feature_download_popup.dart';
import 'package:naeun_front/screens/record/record_feature_wrong_popup.dart';

import '../../models/record_result.dart';

class RecordFeatureResult extends StatefulWidget {
  final String title;

  RecordFeatureResult({required this.title});

  @override
  _RecordFeatureResultState createState() => _RecordFeatureResultState();
}

class _RecordFeatureResultState extends State<RecordFeatureResult> {
  int _currentPageIndex = 0; // 현재 페이지 인덱스를 저장하는 변수

  RecordResult recordResult = RecordResult(
    date: '2024.04.11',
    title: '국민은행 KB albe ELS',
    time: '48',
    count: '4',
    itemList: [
      '“원금 손실 위험 없이 높은 수익을 기대할 수 있다는 장점이 있습니다.”',
      '“최근 3년간 평균 수익률이 10% 이상으로 매우 안정적인 편입니다.”',
      '“주가지수가 장기적으로는 상승하는 경향이 있기 때문에”',
      '“놓치시면 후회하실 수도 있습니다.”',
      '“주가지수가 장기적으로는 상승하는 경향이 있기 때문에 큰 걱정은 하실 필요가 없습니다.”',
    ],
    itemDescriptionList: [
      '과장된 수익 약속:\nELS 상품은 원금 손실 가능성이 있는 투자 상품입니다. 하지만, 이 문장은 원금 손실 위험을 언급하지 않고 높은 수익만 강조하고 있습니다.',
      '과거 성과에 대한 과도한 의존:\n과거 수익률이 미래 수익률을 보장하지 않습니다. 하지만, 이 문장은 과거 수익률을 근거로 상품의 안정성을 주장하고 있습니다.',
      '불확실한 미래에 대한 과한 확신:\n주가지수는 예측할 수 없으며, 장기적으로 상승한다는 보장이 없습니다. 하지만, 이 문장은 주가지수가 상승할 것이라고 단정하고 있습니다.\n\n필수 사항의 무시: \n주가지수 하락으로 인한 원금 손실 가능성을 제대로 언급하지 않고 있습니다.',
      '감정적 압박:\n투자자에게 압박감을 주어 투자를 유도하는 표현입니다. 투자는 신중하게 결정해야 하며, 압박감을 느껴서 투자 결정을 내려서는 안 됩니다.',
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RecordDownloadPopup(
                                  date: recordResult.date,
                                  title: recordResult.title,
                                  time: recordResult.date,
                                );
                              },
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
                                      Color(0xFFFFFFFF),
                                      // Start color
                                      Color(0xFFFFFFFF).withOpacity(0.6),
                                      // End color
                                    ],
                                    begin: Alignment.topCenter,
                                    // 100% at the left
                                    end: Alignment
                                        .bottomCenter, // 0% at the right
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
                                  SizedBox(width: 4),
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
                                  SizedBox(width: 4),
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
                                  itemCount: recordResult.itemList.length-1,
                                  itemBuilder: (context, index) {
                                    return buildPageViewItem(
                                        context,
                                        recordResult.itemList[index],
                                        recordResult
                                            .itemDescriptionList[index]);
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  recordResult.itemList.length -1,
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
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          '은행원 : 지금부터 상품 안내를 시작하겠습니다.우선 가입자분의 투자성향테스트를 진행하겠습니다. 안전한 금융상품 가입을 위해 저희쪽에서도 녹취를 진행할 예정인데 동의하시나요?\n\n고객 : 네. 동의합니다.\n\n고객: 요즘 이율이 참 낮아서 돈을 어디에 넣어야 할지 고민이 많네요. 혹시 좋은 투자 상품이 있을까요?\n\n은행원: 안녕하세요, 고객님! 저희 신한투자증권 은행 지점 컨설턴트입니다. 고객님의 고민, 이해합니다. 사실 이 시기에는 정말 투자하기 좋은 기회가 많습니다. 특히, 저희 ELS 상품은 안정적인 수익을 원하시는 고객에게 최고의 선택이 될 거라고 생각합니다.\n\n고객: ELS 상품이라는 건 처음 들어보는데 어떤 상품인지 자세히 설명해 줄 수 있나요?\n\n은행원: 네, ELS 상품은 주가지수에 연동된 투자상품입니다.',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text:
                                          '원금 손실 위험 없이 높은 수익을 기대할 수 있다는 장점이 있습니다.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFE3A3B),
                                        decorationColor: Color(0xFFFE3A3B),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '특히, 저희 신한투자증권의 ELS 상품은 ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text:
                                          '최근 3년간 평균 수익률이 10% 이상으로 매우 안정적인 편입니다.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFE3A3B),
                                        decorationColor: Color(0xFFFE3A3B),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '실제로 많은 고객님들이 ELS 상품을 통해 안정적인 수익을 창출하고 계십니다.\n\n고객: 원금 손실 위험 없다는 건 정말 매력적인데요. 그럼 수익률은 얼마나 되나요?\n\n은행원: 예상 수익률은 15% 정도로 예상됩니다. 다만, 실제 수익률은 주가지수의 변동에 따라 달라질 수 있습니다. 하지만 과거 실적을 보면 주가지수가 장기적으로는 상승하는 경향이 있기 때문에 큰 걱정은 하실 필요가 없습니다. 또한, 저희 신한투자증권은 전문적인 투자 분석을 통해 최적의 투자 전략을 제공합니다. 고객님은 편안하게 투자하시면 됩니다.\n\n고객: 투자 기간은 얼마나 되나요?\n\n은행원: ELS 상품의 투자 기간은 5년입니다. 5년이라는 기간은 조금 길다고 생각될 수도 있지만, 안정적인 수익을 기대하기 위해서는 어느 정도 기간이 필요하다는 점 양해 부탁드립니다. 물론, 조기 상환도 가능합니다\n\n고객: 5년이라는 기간은 좀 길고, 주가지수가 하락할 위험도 있다니 신중하게 생각해봐야겠어요.\n\n은행원: 네, 맞습니다. 투자는 신중하게 결정해야 합니다. 하지만, ELS 상품은 안정적인 수익을 추구하는 고객에게 매우 적합한 상품입니다. 특히, 고객님처럼 은퇴 후 안정적인 수입을 원하시는 고객에게 추천드립니다.\n\n고객: 그런데 투자에 대한 경험이 전혀 없어서 걱정스럽네요.\n\n은행원: 걱정하지 마세요. 저희 컨설턴트가 투자 과정에서 고객님을 꼼꼼하게 안내해 드립니다. 투자 관련 교육 프로그램도 운영하고 있으니 언제든 참여하시면 도움이 될 것입니다.\n\n은행원: 솔직히 말씀드리면, ELS 상품은 현재 매우 인기가 많아서 빠르게 모집 마감될 가능성이 높습니다. 게다가 이번 주에는 특별 프로모션을 진행하고 있어서 더욱 유리하게 투자하실 수 있습니다. 오늘 가입하시면 특별 혜택도 제공됩니다.\n\n고객: 그래도 좀 더 생각해봐야겠어요.\n\n은행원: 고객님, 혹시 ELS 상품에 대해 궁금한 점이나 불안한 점이 있으신가요? 솔직하게 말씀해주시면 제가 최대한 친절하게 설명해 드리겠습니다.\n\n고객: 그래도 주가지수가 하락하면 돈을 잃을 수도 있다는 게 걱정스럽네요.\n\n은행원: 네, 고객님의 우려는 이해합니다. 하지만 과거 실적을 보면',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '주가지수가 장기적으로는 상승하는 경향이 있기 때문에 큰 걱정은 하실 필요가 없습니다. ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFE3A3B),
                                        decorationColor: Color(0xFFFE3A3B),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '또한, 저희 신한투자증권은 전문적인 투자 분석을 통해 최적의 투자 전략을 제공합니다.\n\n고객: 그래도요...\n\n은행원: 고객님, ELS 상품은 정말 좋은 기회입니다. 지금 투자하시면 안정적인 수익을 기대할 수 있을 뿐만 아니라, 특별 혜택도 받으실 수 있습니다.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '놓치시면 후회하실 수도 있습니다.\n\n',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFE3A3B),
                                        decorationColor: Color(0xFFFE3A3B),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '고객: 그래도...\n\n은행원: 고객님, 저희 컨설턴트가 고객님의 투자 목표와 상황에 맞춰 최적의 투자 전략을 세우도록 도와드릴 것입니다.\n\n은행원: 고객님, ELS 상품에 가입해주셔서 감사합니다. 혹시 투자 과정에서 궁금한 점이나 불편한 점이 있으면 언제든지 저에게 문의해주세요.',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
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
                      // 이미지 버튼의 동작 추가
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

  Widget buildPageViewItem(
      BuildContext context, String title, String description) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return RecordWrongPopup(
                title: title, description: description
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 26, horizontal: 23),
        margin: EdgeInsets.only(top: 16, right: 9),
        decoration: BoxDecoration(
          color: Color(0xFFF2F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
          softWrap: true,
        ),
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
}

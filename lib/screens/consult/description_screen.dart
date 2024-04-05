import 'dart:ui';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../percent_progress_indicator.dart';
import 'bottom_drawer_img.dart';


class DescriptionScreen extends StatefulWidget {
  final String descriptionTitle;

  const DescriptionScreen({super.key, required this.descriptionTitle});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

  // 위험비율 이미지 파일로 대체
  var danger = [
    'assets/danger_rate/danger1.png',
    'assets/danger_rate/danger2.png',
    'assets/danger_rate/danger3.png',
    'assets/danger_rate/danger4.png',
    'assets/danger_rate/danger5.png',
    'assets/danger_rate/danger6.png'
  ];

  Future<Map<String, dynamic>> fetchData(String productId) async {
    final url = Uri.parse('http://35.216.24.226:8080/api/v1/product?product=$productId');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      // Assuming 'response' is the HTTP response object
      var decodedResponse = utf8.decode(response.bodyBytes);
      var responseData = json.decode(decodedResponse);

      return responseData;

    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData('3').then((data) {
      print(data);
      // Handle the retrieved data here
    }).catchError((error) {
      // Handle errors here
    });
  }


  final ValueNotifier<bool> _listening = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff4678FE),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // todo : actions에 넣을 글자크기 변경 아이콘이 없어서 (한글 모양의) 커스텀 위젯 만들어야 할 듯, but 우선순위 최하
      ),
      floatingActionButton: Stack(children: [
        Align(
          alignment: Alignment(
            Alignment.bottomRight.x - 0.05,
            Alignment.bottomRight.y - 0.25,
          ),
          child: Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xff0045FF),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // 그림자 색상과 투명도 설정
                  spreadRadius: 1, // 그림자의 확산 범위
                  blurRadius: 5, // 그림자의 흐림 정도
                  offset: Offset(0, 3), // 그림자의 위치 조정 (가로, 세로)
                ),
              ],
            ),
            child: const Center(
                child: Text(
              '설명듣기',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        Align(
          alignment: Alignment(
            Alignment.bottomRight.x,
            Alignment.bottomRight.y - 0.02,
          ),
          child: FloatingActionButton.large(
            onPressed: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog.fullscreen(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: _naeunDialog(widget.descriptionTitle)
                      ));
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            splashColor: Colors.transparent,
            highlightElevation: 0,
            child: Container(
              width: 100, // 이미지의 너비
              height: 100, // 이미지의 높이
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/floating_naeun.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ]),
      // 그림자 없음
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      // 버튼 위치 설정
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. 상품 제목 위젯
            _titleInfoWidget(widget.descriptionTitle, 2),

            Column(
              children: <Widget>[
                // 2. 기본 정보 위젯
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: _basicInfoWidget(),
                ),
                const SizedBox(
                  height: 10,
                ),
                _underBar(),
                const SizedBox(
                  height: 30,
                ),

                // 3. 나은이가 알려주는 주의사항 위젯
                Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: _cautionWidget(widget.descriptionTitle)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleInfoWidget(String title, int riskRate) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xff4678FE),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const Text(
              '상품이란?',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  danger[riskRate - 1],
                  width: 200,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _basicInfoWidget() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '기본 정보',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff191919),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '잘 모르겠다면, 버튼을 눌러보세요!',
                style: TextStyle(fontSize: 14, color: Color(0xff878787)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // todo : 기본 정보로 보여줄 '유형이름' 6개와 '유형내용' n개 받아와서 보여주기
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _infoTile("판매사", "우리은행", "grey"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomDrawerImg()));
                  },
                    child: _infoTile("증권유형", "수익한도제한", "grey")),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                _infoTile("위험지표", "2", "red"),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _infoTile("조건충족시수익", "5.0%", "grey"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                _infoTile("최대손실률", "-100%", "red"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                _infoTile("기초자산", "S&P500외 2", "grey"),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _infoTile(String title, String content, String tileColor) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: tileColor=="grey"? Color(0xffF2F4F6) : Color(0xffFFF1F1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12, color: tileColor=="grey"? Color(0xff777E8A):Color(0xffFE3A3B), fontWeight: FontWeight.w500),
          ),
          Text(
            content,
            style: TextStyle(fontSize: 14, color: tileColor=="grey"? Color(0xff777E8A):Color(0xffFE3A3B), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _underBar() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 4,
        color: const Color(0xffF9F9F9),
      ),
    );
  }

  Widget _cautionWidget(String title) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              '나은이가 알려주는 상품  이야기',
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff191919),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            )),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '안녕하세요! 오늘은 신한투자증권에서 판매하는 2880호 주가연계파생결합사채(ELB)에 대해 쉽게 설명해 드릴게요. 이름이 조금 어렵죠? 이 상품은 삼성전자 주식을 기초자산으로 하는 투자 상품이에요. 만약 삼성전자 주식 가격이 오르면 이익을 얻고, 떨어지더라도 원금 손실은 없도록 설계된 상품입니다. 투자 기간은 2024년 3월 22일부터 2024년 12월 20일까지 약 9개월 정도예요.이 상품의 최대 수익률은 연 3.801%입니다. 이 수익률을 얻기 위해서는 삼성전자 주식 가격이 투자 시작일보다 5배 이상 올라야 합니다. 하지만 삼성전자 주식 가격이 5배 이상 오르지 않더라도, 투자 기간 동안 가격이 떨어지지만 않으면 연 3.8%의 수익을 얻을 수 있습니다. 따라서 이 상품은 정기예금 등 안전한 상품에 투자하는 안정형 투자자에게 적합합니다. 다만, 주식 시장은 항상 변동하기 때문에 삼성전자 주식 가격이 크게 떨어질 가능성도 있습니다. 하지만 이 상품은 원금 손실이 발생하지 않도록 설계되었기 때문에, 투자한 원금을 잃을 걱정은 하지 않으셔도 됩니다. 투자는 항상 신중하게 결정해야 하지만, 이 상품은 비교적 안전하면서도 정기예금보다 높은 수익을 기대할 수 있는 상품입니다.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _naeunDialog(String descriptionTitle) {
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
                  descriptionTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '에 대해 알려드릴게요',
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
                    return SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!_listening.value) const SizedBox() else
                            const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: PercentProgressIndicator(
                                      percent: 0.4,
                                      progressColor: const Color(0xff3168FD),
                                    ))),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _listening.value
                                    ? Colors.transparent
                                    : const Color(0xff3168FD),
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
                          ),
                        ],
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

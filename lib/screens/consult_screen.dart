import 'package:flutter/material.dart';

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({super.key});

  @override
  State<ConsultScreen> createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // todo : flexible 사용해서 비율로 위젯 비율 맞추기
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.multitrack_audio_outlined, color: const Color(0xff0045FF).withOpacity(0.6),),
            SizedBox(height: 20,),
            Text('추천받은 상품이 있으시군요?', style: TextStyle(color: const Color(0xff0045FF), fontSize: 26),),
            Text('상품 이름을 알려주세요!', style: TextStyle(color: const Color(0xff0045FF), fontSize: 26),),
            SizedBox(height: 50,),
            // todo : 검색 기능 연결하기
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('상품 이름을 입력해주세요', style: TextStyle(color: const Color(0xff9BA6B4)),),
                  Icon(Icons.search, color: const Color(0xff0045FF)),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text('아는만큼 보인다!'),
                  Text('당신을 위한 투자 길라잡이'),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            color: Color(0xff3168FD),
                            child: Text('1'),
                          ),
                          SizedBox(width: 10,),
                          Text('ELS(주가지수 연계형 상품)'),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            color: Color(0xff3168FD),
                            child: Text('1'),
                          ),
                          SizedBox(width: 10,),
                          Text('ELS(주가지수 연계형 상품)'),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            color: Color(0xff3168FD),
                            child: Text('1'),
                          ),
                          SizedBox(width: 10,),
                          Text('ELS(주가지수 연계형 상품)'),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

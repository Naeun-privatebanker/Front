import 'package:flutter/material.dart';
import 'package:naeun_front/screens/consult/half_circle_widget.dart';

class DescriptionScreen extends StatefulWidget {
  final String descriptionTitle;
  const DescriptionScreen({super.key, required this.descriptionTitle});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff4678FE),
        leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back_ios), onPressed: () {
              Navigator.pop(context);
            },
          ),
        // todo : actions에 넣을 글자크기 변경 아이콘이 없어서 (한글 모양의) 커스텀 위젯 만들어야 할 듯, but 우선순위 최하
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. 상품 제목 위젯
            _titleInfoWidget(widget.descriptionTitle, "2", "높은 위험"),

            Column(
              children: <Widget>[
                // 2. 기본 정보 위젯
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: _basicInfoWidget(),
                ),
                const SizedBox(height: 10,),
                _underBar(),
                const SizedBox(height: 30,),

                // 3. 나은이가 알려주는 주의사항 위젯
                Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: _cautionWidget()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleInfoWidget(String title, String riskRate, String riskName){
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xff4678FE),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24,24,24,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),),
            const Text('상품이란?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),),
            HalfCircleWidget(riskRate, riskName),
          ],
        ),
      ),
    );
  }


  Widget _basicInfoWidget(){
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('기본 정보', style: TextStyle(fontSize: 20, color: Color(0xff191919), fontWeight: FontWeight.w600),),
              SizedBox(height: 3,),
              Text('잘 모르겠다면, 버튼을 눌러보세요!', style: TextStyle(fontSize: 14, color: Color(0xff878787)),),
            ],
          ),
        ),
        const SizedBox(height: 18,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // todo : 기본 정보로 보여줄 '유형이름' 6개와 '유형내용' n개 받아와서 보여주기
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _infoTile("판매사", "우리은행"),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                _infoTile("증권유형", "수익한도제한"),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                _infoTile("위험지표", "2"),
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _infoTile("조건충족시수익", "5.0%"),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                _infoTile("최대손실률", "-100%"),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                _infoTile("기초자산", "S&P500외 2"),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _infoTile(String title, String content){
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffF2F4F6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Color(0xff777E8A)),),
          Text(content, style: const TextStyle(fontSize: 14, color: Color(0xff565D66)),),
        ],
      ),
    );
  }

  Widget _underBar(){
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 4,
        color: const Color(0xffF9F9F9),
      ),
    );
  }

  Widget _cautionWidget(){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.purple,
      child: Column(
        children: [
          const Text('기본 정보', style: TextStyle(fontSize: 20, color: Color(0xff191919), fontWeight: FontWeight.w600),),
          const SizedBox(height: 10,),
          Container(
            color: Colors.yellowAccent,
            child: Text('상품명 내용'),
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:naeun_front/screens/record/record_screen.dart';
import 'package:naeun_front/screens/tab_control_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 1. 다시 듣기 머시기
            Row(
              children: [
                const Icon(Icons.play_arrow, size: 28, color: Color(0xff618BFB),),
                const SizedBox(width: 5),
                Text('다시듣기', style: TextStyle(fontSize: 16, color: const Color(0xff618BFB).withOpacity(0.5), fontWeight: FontWeight.w500)),
              ],
            ),
            // 2. row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                Container(
                  width: 250,
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff3168FD),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('아래 보기 중 도움이 필요한', style: TextStyle(color: Colors.white, fontSize: 18),),
                      Text('상황을 선택해주세요', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                )

              ],
            ),
            const SizedBox(height: 15,),

            // 3. 카드 여러개
            // 첫번째 card
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const TabControlScreen(index: 2, recordTabNum: 0)));
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0,10,0,10),
                padding: const EdgeInsets.all(10),
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: const Icon(Icons.call, size: 40, color: Color(0xff0045FF))),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("전화로 가입을 권유받았어요", style: TextStyle(fontSize: 18),),
                        Text("상품권유", style: TextStyle(fontSize: 14, color: Color(0xff878787)),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // 두 번째 카드 -> 녹취 탭으로 페이지 연결
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const TabControlScreen(index: 2, recordTabNum: 0,)));
                },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0,10,0,10),
                padding: const EdgeInsets.all(10),
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: const Icon(Icons.announcement, size: 40, color: Color(0xff0045FF))),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("은행원 설명이 의심스러워요", style: TextStyle(fontSize: 18),),
                        Text("상품가입 중", style: TextStyle(fontSize: 14, color: Color(0xff878787)),),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // 세 번째 카드 -> 이해도 퀴즈 탭으로 이동
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const TabControlScreen(index: 2, recordTabNum: 1)));
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0,10,0,10),
                padding: const EdgeInsets.all(10),
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: const Icon(Icons.question_mark, size: 40, color: Color(0xff0045FF))),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("내가 잘 이해했는지 모르겠어요", style: TextStyle(fontSize: 18),),
                        Text("상품가입 후", style: TextStyle(fontSize: 14, color: Color(0xff878787)),),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // 네 번째 카드 -> 마이페이지 탭이랑 연결
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TabControlScreen(index: 3, recordTabNum: 0)));
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0,10,0,10),
                padding: const EdgeInsets.fromLTRB(0,10,0,10),
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: const Icon(Icons.warning, size: 40, color: Color(0xff0045FF))),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("금융피해를 당한 것 같아요", style: TextStyle(fontSize: 18),),
                        Text("불완전판매 발생", style: TextStyle(fontSize: 14, color: Color(0xff878787)),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

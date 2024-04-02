import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3168FD),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            width: MediaQuery.of(context).size.width,
            height: 370,
            color: Color(0xff3168FD),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('다른 도움이 필요하세요?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),),
                    Text('나은이의 도움을 받아보세요', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),),
                  ],
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    print('불완전판매 피해신고 누름');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24,0,24,0),
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xffFF4546),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.highlight_sharp, size: 36, color: Colors.white,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('피해를 당했다면', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),),
                                Text('불완전판매 피해신고', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
                              ],
                            )
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_sharp, size: 26, color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    print('불완전판매 피해란? 누름');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24,0,24,0),
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.highlight_sharp, size: 36, color: Color(0xff3168FD),),
                            SizedBox(width: 10,),
                            Text('불완전판매 피해란?', style: TextStyle(color: Color(0xff3168FD), fontWeight: FontWeight.w600, fontSize: 18),)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_sharp, size: 26, color: Color(0xffC5C5C5),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                              print('알림 설정!');
                          },
                        child: Text('알림설정', style: TextStyle(fontSize: 16, color: Color(0xff353535)),),
                      ),
                      Icon(Icons.arrow_forward_ios_sharp, color: Color(0xffD9D9D9), size: 20),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          print('공지 사항!');
                        },
                        child: Text('공지사항', style: TextStyle(fontSize: 16, color: Color(0xff353535)),),
                      ),
                      Icon(Icons.arrow_forward_ios_sharp, color: Color(0xffD9D9D9), size: 20),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          print('고객 센터!');
                        },
                        child: Text('고객센터', style: TextStyle(fontSize: 16, color: Color(0xff353535)),),
                      ),
                      Icon(Icons.arrow_forward_ios_sharp, color: Color(0xffD9D9D9), size: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            height: 4,
            color: Color(0xffEBEBEC),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){
                      print('로그아웃!');
                    },
                    child: Text('로그아웃', style: TextStyle(fontSize: 16, color: Color(0xff8B95A1),)),
                  ),
                  Icon(Icons.arrow_forward_ios_sharp, color: Color(0xffD9D9D9), size: 20,),
                ],
              ),
            ),

          ),
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naeun_front/screens/record/record_feature_screen.dart';
import 'package:naeun_front/screens/record/record_screen_tab.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 47),
          Container(
            width: 400,
            height: 330,
            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
            constraints: BoxConstraints.tightFor(width: double.infinity),
            decoration: BoxDecoration(
              color: Color(0xFF3168FD),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(top: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/svg/ic_record_main.svg',
                  fit: BoxFit.cover,
                  semanticsLabel: 'Record Icon',
                ),
                SizedBox(height: 16),
                Text(
                  '상품 가입과정을 녹음해 \n 안전하게 보호받아요',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Opacity(
                  opacity: 0.8,
                  child: Text(
                    '주의표현을 검출해줘요',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 21),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecordFeatureScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 24, right: 24, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      '녹음하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3168FD),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 21),
              ],
            ),
          ),
          RecordScreenTab(recordCount: 3, isNewQuizExist: true), // TabPage 추가
        ],
      ),
    );
  }
}
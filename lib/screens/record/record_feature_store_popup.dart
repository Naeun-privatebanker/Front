import 'package:flutter/material.dart';
import 'package:naeun_front/screens/record/record_feature_result.dart';

class RecordStoreopup extends StatelessWidget {
  final Function onCancel;
  String title = ''; // 제목을 저장할 변수 추가

  RecordStoreopup({required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      contentPadding: EdgeInsets.all(16),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
            width: double.maxFinite,
            height: double.minPositive,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "녹음을 마치시겠습니까?\n가입상품 이름을 입력해주세요",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 3,
                      padding: EdgeInsets.only(left: 13, top: 14, bottom: 14),
                      color: Color(0xFF3168FD),
                      margin: EdgeInsets.only(right: 8, top: 10, bottom: 10),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          // 텍스트가 변경될 때마다 값을 업데이트
                          title = value;
                        },
                        decoration: InputDecoration(
                          hintText: '예) 채움 고정금지모기지론',
                          hintStyle: TextStyle(
                            color: Color(0xFF9BA6B4),
                            fontSize: 16,
                            height: 1.5,
                          ),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 46),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '아니요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF878787),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFF2F4F6),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecordFeatureResult(title: title)),
                      );
                    },
                    child: Text(
                      '녹음완료',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF3168FD),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

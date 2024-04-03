import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class RecordDownloadPopup extends StatelessWidget {
  final String date;
  final String title;
  final String time;

  RecordDownloadPopup({required this.date, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: AlertDialog(
        backgroundColor: Colors.white,
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
                  "음성파일 저장",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "개인정보가 담겨있는 파일입니다.\n타인에게 공유하는 것을 지양해주세요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF353535),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [
                            Color(0xFF3168FD), // Start color
                            Color(0xFF3168FD).withOpacity(0.6), // End color
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
                    SizedBox(width: 4), // Add spacing between the image and the text
                    Text(
                      '${date}_${title}',
                      style: TextStyle(
                        color: Color(0xFF3168FD),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '취소',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF878787),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFF2F4F6),
                        padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 38),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '다운받기',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF3168FD),
                        padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:naeun_front/screens/record/record_feature_cancle_popup.dart';
import 'package:naeun_front/screens/record/record_feature_store_popup.dart';

class RecordFeatureScreen extends StatefulWidget {
  @override
  _RecordFeatureScreenState createState() => _RecordFeatureScreenState();
}

class _RecordFeatureScreenState extends State<RecordFeatureScreen> {
  // 현재 일시 변수 추가
  String currentDateTime =
  DateFormat('yyyy.MM.dd HH:mm').format(DateTime.now());
  Timer? _timer;
  bool recordingStarted = false; // 녹음 시작 여부를 나타내는 변수
  int elapsedSeconds = 0; // 녹음된 시간을 나타내는 변수

  // 녹음 시작 버튼 클릭 시 호출되는 함수
  void startRecording() {
    setState(() {
      recordingStarted = true;
    });

    // 타이머 시작: 1초마다 elapsedSeconds를 증가시킴
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        elapsedSeconds++;
      });
    });
  }

  // 녹음 일시 정지 버튼 클릭 시 호출되는 함수
  void pauseRecording() {
    int nowTime = elapsedSeconds;
    _timer?.cancel();

    // 타이머 정지
    setState(() {
      recordingStarted = false;
      elapsedSeconds = nowTime;
    });
  }

  // 녹음 중지 버튼 클릭 시 호출되는 함수
  void stopRecording(bool isFinished) {
    // 녹음 관련 작업 수행
    // 저장 등의 동작을 수행할 수 있음

    if (isFinished) {
      _showToast(context, '녹음본이 저장되었습니다. 내 파일을 확인해주세요');
    } else {
      _showToast(context, '녹음본이 취소되었습니다.');
    }

    // 변수 초기화
    setState(() {
      recordingStarted = false;
      elapsedSeconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = elapsedSeconds ~/ 60;
    int seconds = elapsedSeconds % 60;
    String formattedTime =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Color(0xFFF2F4F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 47, left: 4),
            child: TextButton(
              child: SvgPicture.asset(
                'assets/svg/ic_record_back.svg',
                fit: BoxFit.cover,
                semanticsLabel: 'go back',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 28),
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_record_voice.svg',
                    width: double.maxFinite,
                    semanticsLabel: 'start record',
                  ),
                  Positioned(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentDateTime, // 현재 일시 표시
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: Color(0xFF3168FD).withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '상품 가입 설명 시간은',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            color: Color(0xFF3168FD).withOpacity(0.9),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '평균 ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                                color: Color(0xFF3168FD).withOpacity(0.9),
                              ),
                            ),
                            Text(
                              '50분',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                                color: Color(0xFF0045FF),
                              ),
                            ),
                            Text(
                              '입니다.',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                                color: Color(0xFF3168FD).withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        TextButton(
                          onPressed: () {
                            recordingStarted = !recordingStarted;
                            if (recordingStarted) {
                              startRecording();
                            } else {
                              pauseRecording();
                            }
                          },
                          child: SvgPicture.asset(
                            recordingStarted
                                ? 'assets/svg/ic_record_on.svg'
                                : 'assets/svg/ic_record_off.svg',
                            fit: BoxFit.cover,
                            semanticsLabel: 'start record',
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(20),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0045FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 66),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 24, left: 12),
                  child: TextButton(
                    onPressed: () {
                      pauseRecording();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RecordCancelPopup(
                            onCancel: () {
                              recordingStarted = false;
                              stopRecording(false);
                            },
                          );
                        },
                      );
                    },
                    child: Text('취소',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF878787),
                        )),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 58),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFFD9D9D9)),
                        borderRadius:
                        BorderRadius.circular(10), // 버튼을 round하게 변경
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: TextButton(
                    onPressed: () {
                      pauseRecording();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RecordStoreopup(
                            onCancel: () {
                              recordingStarted = false;
                              stopRecording(true);
                            },
                          );
                        },
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
                      padding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10), // 버튼을 round하게 변경
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void _showToast(BuildContext context, String msg) {
  }
}
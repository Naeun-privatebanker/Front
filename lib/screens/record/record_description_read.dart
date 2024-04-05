import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../percent_progress_indicator.dart'; // Timer를 사용하기 위해 추가해주세요.

class RecordDescriptionRead extends StatefulWidget {
  @override
  _RecordDescriptionRead createState() => _RecordDescriptionRead();
}

class _RecordDescriptionRead extends State<RecordDescriptionRead> {
  int _descriptionIndex = 0;
  List<String> _descriptionTitles = [
    '“고객님 이 상품은 원금 손실\n될 확률이 거의 없어요.” ',
    '이 표현은 원금 손실\n위험을 제대로 고지하지\n않고있습니다.',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 6), (timer) {
      _updateDescription();
    });
  }

  final ValueNotifier<bool> _listening = ValueNotifier<bool>(false);

  void _updateDescription() {
    setState(() {
      _descriptionIndex = (_descriptionIndex + 1) % _descriptionTitles.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _naeunDialog(_descriptionTitles[_descriptionIndex], false);
  }

  Widget _naeunDialog(String descriptionTitle, bool colorCheck) {
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
                if(_listening.value)...[
                  const SizedBox(height: 10),
                  Text(
                    '의심표현 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFFFFFFF).withOpacity(0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
                const SizedBox(height: 10),
                Text(
                  _listening.value ? descriptionTitle : '오안내 의심표현을\n함께 확인해봐요',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                          if (!_listening.value)
                            const SizedBox()
                          else
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: PercentProgressIndicator(
                                  percent: 0.20,
                                  progressColor: colorCheck
                                      ? Color(0xff3168FD)
                                      : Color(0xffFE3A3B),
                                ))),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: _listening.value
                                    ? Colors.transparent
                                    : (colorCheck
                                        ? Color(0xff3168FD)
                                        : Color(0xffFE3A3B)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.8,
                                    55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      width: 1.0,
                                      color: _listening.value
                                          ?  Color(0x00fff4f6).withOpacity(0.4)
                                          : Colors.transparent,
                                    ))),
                            onPressed: () {
                              setState(() {
                                _listening.value =
                                    !_listening.value; // 상태를 토글합니다.
                                print('상태변경!');
                                print(_listening.value);
                              });
                            },
                            child: Center(
                              child: Text(
                                _listening.value ? '그만 듣기' : '설명 듣기',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
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

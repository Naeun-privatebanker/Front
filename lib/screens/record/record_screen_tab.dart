import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naeun_front/screens/record/record_screen_tab_quiz_item.dart';
import 'package:naeun_front/screens/record/record_screen_tab_record_item.dart';
import 'package:naeun_front/models/record.dart';
import 'package:naeun_front/models/quiz.dart';

class RecordScreenTab extends StatefulWidget {
  final int recordCount;
  final bool isNewQuizExist;
  final int initialIndex;

  const RecordScreenTab({
    Key? key,
    required this.recordCount,
    required this.isNewQuizExist,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _RecordScreenTabState createState() => _RecordScreenTabState();
}

class _RecordScreenTabState extends State<RecordScreenTab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Record> recordList = [
    Record(warningCount: 4, date: 2, title: '국민은행 KB albeELS'),
    Record(warningCount: 2, date: 2, title: '신한투자증권(ELS) 25490'),
    Record(warningCount: 0, date: 0, title: '하나증권(ELS) 15576'),
  ];

  List<Quiz> quizList = [
    Quiz(
        title: '국민은행 KB albeELS',
        isQuizDone: true,
        understand: 0,
        quizLabel: 'none'),
    Quiz(
        title: '신한투자증권(ELS) 25490',
        isQuizDone: false,
        understand: 50,
        quizLabel: '주의'),
    Quiz(
        title: '국민은행 KB albeELS',
        isQuizDone: false,
        understand: 70,
        quizLabel: '안전'),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Color(0xFFF2F4F6),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0, color: Color(0x00D9D9D9)),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0x66000000),
                  fontSize: 18,
                ),
                tabs: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    alignment: Alignment.center,
                    child: Text(
                      '녹음목록 ${widget.recordCount}',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '이해도퀴즈',
                        ),
                        SizedBox(width: 4),
                        if (widget.isNewQuizExist)
                          SvgPicture.asset(
                            'assets/svg/ic_record_quiz_new.svg',
                          ),
                      ],
                    ),
                  ),
                ],
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(10), // 둥근 테두리 설정
                  borderSide: BorderSide(width: 4.0, color: Colors.black),
                  insets: EdgeInsets.symmetric(horizontal: 0),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      key: const PageStorageKey("RECORD"),
                      itemCount: recordList.length,
                      itemBuilder: (context, index) {
                        return RecordTabRecordItem(
                          warningCount: recordList[index].warningCount,
                          date: recordList[index].date,
                          title: recordList[index].title,
                        );
                      }),
                  ListView.builder(
                      key: const PageStorageKey("QUIZ"),
                      itemCount: recordList.length,
                      itemBuilder: (context, index) {
                        return RecordTabQuizItem(
                          title: quizList[index].title,
                          isQuizDone: quizList[index].isQuizDone,
                          understand: quizList[index].understand,
                          quizLabel: quizList[index].quizLabel,
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

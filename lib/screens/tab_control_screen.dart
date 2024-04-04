import 'package:flutter/material.dart';
import 'record/record_screen.dart';
import 'consult/consult_screen.dart';
import 'home/home_screen.dart';
import 'my/my_screen.dart';

class TabControlScreen extends StatefulWidget {
  final int index;
  final int recordTabNum;
  const TabControlScreen({Key? key, required this.index, required this.recordTabNum}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TabControlScreen> {
  int _selectedIndex = 0;
  late int _recordTabNum;

  @override
  void initState() {
    super.initState();
    _onItemTapped(widget.index);
    _recordTabNum = widget.recordTabNum;
  }

  late List<Widget> pages;

  void _initializePages() {
    pages = <Widget>[
      const HomeScreen(),
      const ConsultScreen(),
      RecordScreen(initialIndex: _recordTabNum),
      const MyScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initializePages();
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff0045FF),
        unselectedItemColor: const Color(0xffD9D9D9),
        selectedLabelStyle: const TextStyle(color: Color(0xff0045FF)),
        unselectedLabelStyle: const TextStyle(color: Color(0xffD9D9D9)),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.headset_mic_rounded), label: '상담'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: '녹취'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
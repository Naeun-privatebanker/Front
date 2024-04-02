import 'package:flutter/material.dart';
import 'record/record_screen.dart';
import 'consult/consult_screen.dart';
import 'home_screen.dart';
import 'my_screen.dart';

class TabControlScreen extends StatefulWidget {
  final int index;
  const TabControlScreen({Key? key, required this.index}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TabControlScreen> {
  int _selectedIndex = 0;

  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const ConsultScreen(),
    const RecordScreen(),
    const MyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _onItemTapped(widget.index);
  }

  @override
  Widget build(BuildContext context) {
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
        showSelectedLabels: true, // Show labels for selected tab
        showUnselectedLabels: true, // Show labels for unselected tabs
      ),
    );
  }
}

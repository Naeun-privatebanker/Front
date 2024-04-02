import 'package:flutter/material.dart';
import 'package:naeun_front/screens/consult/description_screen.dart';
import 'package:provider/provider.dart';


class SearchResultScreen extends StatefulWidget {
  final String serachKeyword;
  const SearchResultScreen({super.key, required this.serachKeyword});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  String searchKeyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: const Color(0xff222222),
            icon: const Icon(Icons.arrow_back_ios), onPressed: () {
              Navigator.pop(context);
            },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Icon(
                    Icons.multitrack_audio_rounded,
                    color: const Color(0xff0045FF).withOpacity(0.6),
                    size: MediaQuery.of(context).size.width * 0.1, // 아이콘 크기를 화면 너비의 10%로 설정
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '추천받은 상품이 있으시군요?',
                    style: TextStyle(color: Color(0xff0045FF), fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    '상품 이름을 알려주세요!',
                    style: TextStyle(color: Color(0xff0045FF), fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              // 2. 검색창
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                width: MediaQuery.of(context).size.width,
                height: 60, // 검색창 높이를 화면 너비의 12%로 설정
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          hintText: widget.serachKeyword,
                          hintStyle: const TextStyle(color: Color(0xff9BA6B4), fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        onChanged: (value){
                          setState(() {
                            searchKeyword = value;
                            print(searchKeyword);
                          });
                        },
                        //todo : 검색키워드 누르면 검색 결과로 넘어가기
                        onSubmitted: (value) {
                          context.read<RecentSearches>().addSearchKeyword(searchKeyword); // 여기서 context.read를 사용합니다.
                          // Navigator.push(context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             ResultPage(searchKeyword: searchKeyword, cafeQuery: CafeService().getCafesBySearchKeyword(searchKeyword))));
                        },
                      ),
                    ),
                    IconButton(
                        icon : const Icon(Icons.close, color: Color(0xffD0D5DB), size: 28,), onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SearchResultScreen(
                                    serachKeyword: searchKeyword,)));
                    }
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // 3. 투자 길라잡이
              Container(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                height: MediaQuery.of(context).size.height * 0.5, // 투자 길라잡이 높이를 화면 높이의 30%로 설정
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '검색결과',
                      style: TextStyle(fontSize: 18, color: Color(0xff565D66), fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),

                    // todo : 검색 결과 받아와서 제목 뿌려주기, 일단은 하드코딩
                    _buildSearchedItem('신한투자증권(ELS) 25490'),
                    _underBarWidget(),
                    _buildSearchedItem('신한투자증권(ELS) 25491'),
                    _underBarWidget(),
                    _buildSearchedItem('신한투자증권(ELS) 25494'),
                    _underBarWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchedItem(String title) {
    return TextButton(
      onPressed: () {
        // todo : 상세페이지로 이동하기
        Navigator.push(context, MaterialPageRoute(
              builder: (context) =>
                  DescriptionScreen(descriptionTitle: title,)));
      }
      , child: Text(title, style: const TextStyle(fontSize: 18, color: Color(0xff565D66), fontWeight: FontWeight.w600)));
  }

  Widget _underBarWidget(){
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 1,
            color: const Color(0xffDBDBDC),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class RecentSearches with ChangeNotifier {
  List<String> searchList = [];

  addSearchKeyword(String keyword) {
    searchList.insert(0, keyword);
    notifyListeners();
  }
}

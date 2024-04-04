import 'package:flutter/material.dart';
import 'package:naeun_front/screens/consult/search_result_screen.dart';
import 'package:provider/provider.dart'; // Provider 패키지를 import합니다.
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsultScreen extends StatefulWidget {
  const ConsultScreen({Key? key}) : super(key: key);

  @override
  State<ConsultScreen> createState() => _ConsultScreenState();
}

class _ConsultScreenState extends State<ConsultScreen> {
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              // 1. 오디오 아이콘, 텍스트 문구
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
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          hintText: '상품 이름을 입력해주세요',
                          hintStyle: TextStyle(color: Color(0xff9BA6B4), fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        onChanged: (value){
                          setState(() {
                            searchKeyword = value;
                            print(searchKeyword);
                          });
                        },
                        onSubmitted: (value) async {
                          // Add the search keyword to the recent searches list
                          context.read<RecentSearches>().addSearchKeyword(searchKeyword);

                          // Define the URL with the search query parameter
                          final url = Uri.parse('http://35.216.24.226:8080/api/v1/product/query?query=$value');

                          try{

                            // Make the HTTP GET request
                            final response = await http.get(url);

                            // Check if the request was successful
                            if (response.statusCode == 200) {
                              // Decode the response body using UTF-8 encoding
                              var decodedResponse = utf8.decode(response.bodyBytes);
                              var responseData = json.decode(decodedResponse);

                              // Log the response to the console
                              print(responseData);

                              // Process the response further if needed
                            } else {
                              // If the request was not successful, log the error
                              print('Request failed with status: ${response.statusCode}');
                            }
                          } catch(error) {
                            print('Error occurred: $error');
                          }
                        }

                      ),
                        //todo : 검색키워드 누르면 검색 결과로 넘어가기
                      ),
                    IconButton(
                      icon : const Icon(Icons.search, color: Color(0xff3168FD), size: 28,), onPressed: () {
                        print('아이콘 눌림');
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
                height: MediaQuery.of(context).size.height * 0.35, // 투자 길라잡이 높이를 화면 높이의 30%로 설정
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
                      '아는만큼 보인다!',
                      style: TextStyle(fontSize: 14, color: Color(0xff565D66)),
                    ),
                    const Text(
                      '당신을 위한 투자 길라잡이',
                      style: TextStyle(fontSize: 20, color: Color(0xff565D66)),
                    ),
                    const SizedBox(height: 16),
                    _buildInvestmentItem('ELS(주가지수 연계형 상품)', '1'),
                    const SizedBox(height: 5),
                    _buildInvestmentItem('단기사채', '2'),
                    const SizedBox(height: 5),
                    _buildInvestmentItem('ETF(상장지수펀드)', '3'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInvestmentItem(String title, String num) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.06, // 아이콘 높이를 화면 너비의 6%로 설정
              width: MediaQuery.of(context).size.width * 0.06, // 아이콘 너비를 화면 너비의 6%로 설정
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xff3168FD),
              ),
              child: Center(child: Text(num, style: const TextStyle(fontSize : 14, color: Colors.white),)),
            ),
            const SizedBox(width: 14),
            Text(title, style: const TextStyle(fontSize: 18, color: Color(0xff565D66), fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios_sharp, color: Color(0xffD9D9D9),),
          onPressed: () {
            // todo : 상세페이지로 이동하는 코드 추가
            print('$title 눌림!');
          },
        ),
      ],
    );
  }
}


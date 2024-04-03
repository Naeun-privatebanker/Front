import 'package:flutter/material.dart';

class QuizDialog extends StatefulWidget {
  const QuizDialog({super.key});

  @override
  State<QuizDialog> createState() => _QuizDialogState();
}

class _QuizDialogState extends State<QuizDialog> {
  int quiz_num = 1;

  @override
  Widget build(BuildContext context) {
    return _buildQuiz();
  }

  Widget _buildQuiz() {
    switch (quiz_num) {
      case 1:
        return _buildQuiz1();
      case 2:
        return _buildQuiz2();
      case 3:
        return _buildQuiz3();
      default:
        return SizedBox();
    }
  }

  Widget _buildQuiz1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            // 뒤로가기 아이콘
            const SizedBox(height: 5, width: double.infinity),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    // Navigator.pop(context);
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
                  size: 30, // 아이콘 크기를 화면 너비의 10%로 설정
                ),
                const SizedBox(height: 10),
                Text(
                  'Q1. 본상품은 예·적금과는 다',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '른상품으로 예금자 보호를 받지',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '못해 원금손실위험이 있다.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),

        // 2. 그림 덩어리
        SizedBox(
          width: double.infinity,
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
                left: 130,
                bottom: 200,
                child: Container(
                  width: 160,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent.withOpacity(0.3),
                  ),
                  child: const Center(
                      child: Text(
                    '답을 골라주세요!',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
                )),

            Positioned(
                left: 90,
                bottom: 60,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quiz_num = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 110,
                        height: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: Color(0xffFE3A3B),
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '아니에요',
                              style: TextStyle(
                                  color: Color(0xff565D66), fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          quiz_num = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 110,
                        height: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Color(0xff0045FF),
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '맞아요',
                              style: TextStyle(
                                  color: Color(0xff565D66), fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ]),
        )
      ],
    );
  }

  Widget _buildQuiz2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            // 뒤로가기 아이콘
            const SizedBox(height: 5, width: double.infinity),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState(() {
                      quiz_num = 1;
                    });
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
                  size: 30, // 아이콘 크기를 화면 너비의 10%로 설정
                ),
                const SizedBox(height: 10),
                Text(
                  'Q2. 본상품의 원금손실위험이',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '발생할 가능성에 대해',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '어떻게 생각하시나요?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),

        // 2. 그림 덩어리
        SizedBox(
          width: double.infinity,
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
                left: 130,
                bottom: 300,
                child: Container(
                  width: 160,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent.withOpacity(0.3),
                  ),
                  child: const Center(
                      child: Text(
                        '답을 골라주세요!',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                )),

            Positioned(
                left: 40,
                bottom: 40,
                child: SizedBox(
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            quiz_num = 3;
                          });
                        },
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text('1. 원금손실 위험이 거의 없다', style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            quiz_num = 3;
                          });
                        },
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text('2. 원금손실 위험이 있지만 경미하다', style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            quiz_num = 3;
                          });
                        },
                        child: Container(
                          width: 350,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3. 원금손실 위험이 있지만 높은 수익', style: TextStyle(fontSize: 18),),
                              Text('률을 위해 감수해야한다          ', style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ]),
        )
      ],
    );
  }

  Widget _buildQuiz3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            // 뒤로가기 아이콘
            const SizedBox(height: 5, width: double.infinity),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState((){
                      quiz_num = 2;
                    });
                    // Navigator.pop(context);
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
                  size: 30, // 아이콘 크기를 화면 너비의 10%로 설정
                ),
                const SizedBox(height: 10),
                Text(
                  'Q3. 본상품의 최대 원금손실',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '규모는 어느 정도입니까?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),

        // 2. 그림 덩어리
        SizedBox(
          width: double.infinity,
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
                left: 130,
                bottom: 300,
                child: Container(
                  width: 160,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent.withOpacity(0.3),
                  ),
                  child: const Center(
                      child: Text(
                        '답을 골라주세요!',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                )),

            Positioned(
                left: 40,
                bottom: 40,
                child: SizedBox(
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            quiz_num = 3;
                          });
                        },
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text('1. 원금의 0% ~ -20%                        ', style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            quiz_num = 3;
                          });
                        },
                        child: Container(
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text('2. 원금의 20%~-100%(원금전액)     ', style: TextStyle(fontSize: 18),)),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            quiz_num = 3;
                          });
                        },
                        child: Container(
                          width: 350,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('3. 시장상황에 따라 손실이 무한하게   ', style: TextStyle(fontSize: 18),),
                              Text('커질 수 있다                               ', style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ]),
        )
      ],
    );
  }
}

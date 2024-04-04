import 'package:flutter/material.dart';

class BottomDrawerImg extends StatefulWidget {
  const BottomDrawerImg({super.key});

  @override
  State<BottomDrawerImg> createState() => _BottomDrawerImgState();
}

class _BottomDrawerImgState extends State<BottomDrawerImg> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pop(context);},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
           image: AssetImage('assets/2-4-1.png'),
           fit: BoxFit.contain,
          )
        ),
      ),
    );

  }
}

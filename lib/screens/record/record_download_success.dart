import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecordDownloadSuccess extends StatefulWidget {
  const RecordDownloadSuccess({Key? key});

  @override
  State<RecordDownloadSuccess> createState() => RecordDownloadSuccessDialog();
}

class RecordDownloadSuccessDialog extends State<RecordDownloadSuccess> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _RecordDownloadSuccess();
  }
}

class _RecordDownloadSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "저장 완료!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                decoration: TextDecoration.none
              ),
            ),
            SizedBox(height: 16),
            SvgPicture.asset(
              'assets/svg/ic_record_download_success.svg',
              fit: BoxFit.cover,
              semanticsLabel: 'Download Success Icon',
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "저장파일 바로가기 ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ">",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

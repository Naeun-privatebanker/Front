import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naeun_front/screens/record/record_feature_result.dart';

class RecordTabRecordItem extends StatelessWidget {
  final int warningCount;
  final int date;
  final String title;

  const RecordTabRecordItem({
    Key? key,
    required this.warningCount,
    required this.date,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecordFeatureResult(title: title)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 24, left: 24, bottom: 12),
        padding: EdgeInsets.only(right: 16, left: 24, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '주의 $warningCount개',
                        style: TextStyle(
                          color: warningCount == 0 ? Colors.blue : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                      if (date != 0) ...[
                        SizedBox(width: 4),
                        Text(
                          ' · 남은 숙련기간 ${date + 1}일',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: SvgPicture.asset(
                'assets/svg/ic_record_detail.svg',
                fit: BoxFit.cover,
                semanticsLabel: 'More Detail For $title',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
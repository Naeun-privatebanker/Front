import 'package:flutter/material.dart';

class RecordWrongPopup extends StatelessWidget {
  final String title;
  final String description;

  RecordWrongPopup({required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black.withOpacity(0.5),
        child: AlertDialog(
          surfaceTintColor: Colors.white,
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  "잘못된 설명입니다.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFE3A3B),
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xFFFE3A3B),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '${description}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000).withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 28),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '확인',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF878787),
                      ),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFF2F4F6),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

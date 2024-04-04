import 'package:flutter/material.dart';

class RecordCancelPopup extends StatelessWidget {
  final Function onCancel;

  RecordCancelPopup({required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white, // Set background color to transparent
      contentPadding: EdgeInsets.all(16),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
            width: double.maxFinite,
            height: double.minPositive,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "녹음을 취소할까요?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                ),
              ),
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '아니요',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF878787),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFF2F4F6),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      onCancel();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '녹음취소',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF3168FD),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16)
            ],
          ),
        ],
      ),
    );
  }
}

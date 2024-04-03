// 앱에서 사용되는 데이터 모델을 정의하는 폴더입니다.
// ex. 사용자 정보를 다루는 user.dart 파일

class User {
  final String userId;
  final String accessToken;
  final String refreshToken;

  User({required this.userId, required this.accessToken, required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userId: json["data"]["userId"].toString(),
      accessToken: json["data"]["accessToken"],
      refreshToken: json["data"]["refreshToken"],
    );
  }
}
import 'package:flutter/material.dart'; // Flutter의 기본 위젯 라이브러리 임포트
import 'package:flutter_train_app/pages/HOME_page/home_page.dart'; // HomePage 위젯이 정의된 파일 임포트
import 'package:flutter_train_app/theme.dart'; // 테마 설정이 정의된 theme.dart 파일 임포트

// 애플리케이션의 시작점 (main 함수)
void main() {
  runApp(const MyApp()); // MyApp 위젯을 실행하여 앱을 시작
}

// MyApp 클래스는 StatelessWidget을 상속받아 앱의 기본 구조를 정의
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 생성자, key는 부모 클래스인 StatelessWidget에 전달

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp은 Flutter에서 앱의 전반적인 설정을 관리하는 위젯
      themeMode: ThemeMode.dark,
      /* themeMode: ThemeMode.system 
      - 시스템 테마를 따라 라이트 모드 또는 다크 모드로 자동 전환할 수 있도록 설정 */

      theme: lightTheme,
      /* 라이트 모드에서 사용할 테마를 지정.
      - lightTheme은 theme.dart 파일에 정의된 라이트 모드 테마임.*/

      darkTheme: darkTheme,
      /* 다크 모드에서 사용할 테마를 지정.
      - darkTheme은 theme.dart 파일에 정의된 다크 모드 테마임.*/

      home: HomePage(),
      /* home: HomePage() 
      - 앱이 실행될 때 가장 먼저 보여줄 화면을 지정.
      - 여기서는 HomePage 위젯이 첫 화면으로 설정됨.*/
    );
  }
}

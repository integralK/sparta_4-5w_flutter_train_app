import 'package:flutter/material.dart'; // Flutter의 기본 UI 구성 요소를 가져오는 패키지

// 라이트 모드 테마 설정
final lightTheme = ThemeData(
  useMaterial3: true,
  /*  useMaterial3:
  - Flutter에서 Material Design 3 (M3) 스타일을 사용하도록 설정.
  - M3는 최신 디자인 가이드라인으로, 새로운 UI 컴포넌트와 스타일을 제공. */

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple, // 보라색을 기준으로 색상 체계 생성
    brightness: Brightness.light, // 라이트 모드로 설정
  ),
  /*  colorScheme:
  - ColorScheme.fromSeed를 사용하여 지정된 색상(seedColor)을 기준으로 색상 팔레트를 생성.
  - brightness가 Brightness.light로 설정되어 라이트 모드에 맞는 색상 팔레트가 생성됨. */

  dividerColor: Colors.grey[400], // 구분선 색상 설정 (연한 회색)

  highlightColor: Colors.purpleAccent, // 강조 색상으로 보라색 계열 사용

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.purple), // 버튼 배경색 (보라색)
      foregroundColor: WidgetStatePropertyAll(Colors.white), // 버튼 텍스트 색상 (흰색)
    ),
  ),
  /*  elevatedButtonTheme:
  - ElevatedButton 위젯의 기본 스타일을 지정하는 테마.
  - 버튼의 배경색은 보라색(Colors.purple), 텍스트 색상은 흰색(Colors.white)으로 설정. */

  scaffoldBackgroundColor: Colors.grey[200], // 라이트 모드의 배경색 (밝은 회색)
);

// 다크 모드 테마 설정
final darkTheme = ThemeData(
  useMaterial3: true,
  //다크 모드에서도 Material Design 3 스타일을 사용하도록 설정.

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple, // 보라색을 기준으로 색상 체계 생성
    brightness: Brightness.dark, // 다크 모드로 설정
  ),
  /*  colorScheme:
  - ColorScheme.fromSeed를 사용하여 지정된 색상(seedColor)을 기준으로 색상 팔레트를 생성.
  - brightness가 Brightness.dark로 설정되어 다크 모드에 맞는 색상 팔레트가 생성됨. */

  dividerColor: Colors.grey[400], // 구분선 색상 설정 (연한 회색)

  highlightColor: Colors.purpleAccent, // 강조 색상으로 보라색 계열 사용

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.purple), // 버튼 배경색 (보라색)
      foregroundColor: WidgetStatePropertyAll(Colors.white), // 버튼 텍스트 색상 (흰색)
    ),
  ),
  /*  elevatedButtonTheme:
  - ElevatedButton 위젯의 기본 스타일을 지정하는 테마.
  - 다크 모드에서도 버튼 배경색은 보라색(Colors.purple), 텍스트 색상은 흰색(Colors.white)으로 동일하게 유지됨. */

  scaffoldBackgroundColor: Colors.black, // 다크 모드의 배경색 (검은색)
);

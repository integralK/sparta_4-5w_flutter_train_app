import 'package:flutter/material.dart'; // Flutter의 UI 구성 요소를 가져오는 패키지
import 'package:flutter_train_app/pages/HOME_page/widgets/select_box.dart'; // SelectBox 위젯을 임포트 (출발역, 도착역 선택 박스)
import 'package:flutter_train_app/pages/HOME_page/widgets/select_button.dart'; // SelectButton 위젯을 임포트 (좌석 선택 버튼)
import 'package:flutter_train_app/pages/SUB_page/1_station_list_page.dart'; // StationListPage 위젯을 임포트 (역 선택 리스트 페이지)

// 출발역, 도착역을 선택할 수 있는 초기 화면을 정의하는 StatefulWidget
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState(); // State 객체 생성
}

// HomePage의 상태(State)를 관리하는 클래스
class _HomePageState extends State<HomePage> {
  String? departure; // 출발역 저장 변수 선언 (초기값은 null)
  String? arrival; // 도착역 저장 변수 선언 (초기값은 null)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // 화면 전체에 20픽셀의 패딩 적용
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column의 자식 위젯들을 세로 중앙 정렬
          children: [
            // 출발역과 도착역을 선택할 수 있는 SelectBox 위젯 사용
            SelectBox(
              departureStation: departure, // 출발역 값 전달 (선택된 출발역이 없으면 null)
              arrivalStation: arrival, // 도착역 값 전달 (선택된 도착역이 없으면 null)
              onDepartureTap: () async {
                // 출발역 선택 버튼 클릭 시 실행되는 함수
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '출발역', // StationListPage의 앱바 타이틀을 '출발역'으로 설정
                      isDeparture: true, // 출발역 선택 모드로 설정
                      excludedStation: arrival, // 이미 선택한 도착역은 리스트에서 제외 (중복 방지)
                    ),
                  ),
                );
                if (result != null) {
                  // 사용자가 출발역을 선택한 경우에만 처리
                  setState(() {
                    departure = result; // 선택된 출발역 값을 저장하고 화면에 반영
                  });
                }
              },
              onArrivalTap: () async {
                // 도착역 선택 버튼 클릭 시 실행되는 함수
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '도착역', // StationListPage의 앱바 타이틀을 '도착역'으로 설정
                      isDeparture: false, // 도착역 선택 모드로 설정
                      excludedStation:
                          departure, // 이미 선택한 출발역은 리스트에서 제외 (중복 방지)
                    ),
                  ),
                );
                if (result != null) {
                  // 사용자가 도착역을 선택한 경우에만 처리
                  setState(() {
                    arrival = result; // 선택된 도착역 값을 저장하고 화면에 반영
                  });
                }
              },
            ),
            const SizedBox(
                height: 20), // SelectBox와 SelectButton 사이에 20픽셀 간격 추가

            SelectButton(
              departureStation: departure, // 좌석 선택 버튼에 현재 선택된 출발역 전달 (null 가능)
              arrivalStation: arrival, // 좌석 선택 버튼에 현재 선택된 도착역 전달 (null 가능)
            ),
          ],
        ),
      ),
    );
  }
}

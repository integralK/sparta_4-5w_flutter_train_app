import 'package:flutter/material.dart'; // Flutter의 기본 UI 구성 요소를 가져오는 패키지

// 출발역과 도착역을 선택할 수 있는 SelectBox 위젯
class SelectBox extends StatelessWidget {
  final String? departureStation; // 선택된 출발역 저장 (초기값 null)
  final String? arrivalStation; // 선택된 도착역 저장 (초기값 null)
  final Function() onDepartureTap; // 출발역 선택 버튼을 누를 때 실행할 함수 (반환값 없음)
  final Function() onArrivalTap; // 도착역 선택 버튼을 누를 때 실행할 함수 (반환값 없음)

  // 생성자: 필수 매개변수로 onDepartureTap, onArrivalTap을 받고, departureStation과 arrivalStation은 선택적 매개변수로 받음
  const SelectBox({
    super.key,
    this.departureStation, // 출발역 이름 (선택적, null 가능)
    this.arrivalStation, // 도착역 이름 (선택적, null 가능)
    required this.onDepartureTap, // 출발역 선택 시 호출할 함수 (필수)
    required this.onArrivalTap, // 도착역 선택 시 호출할 함수 (필수)
  });

  @override
  Widget build(BuildContext context) {
    // 현재 테마의 ColorScheme 가져오기
    final colorScheme = Theme.of(context).colorScheme;
    /* Theme.of(context).colorScheme:
    - 현재 앱의 테마에 맞는 색상 체계를 가져옴.
    - 라이트 모드와 다크 모드에 따라 자동으로 적절한 색상을 적용할 수 있음.*/

    return Container(
      height: 200, // 컨테이너 높이 설정
      decoration: BoxDecoration(
        // 테마에 따라 surface 색상을 적용 (라이트/다크 모드 자동 반영)
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20), // 모서리를 둥글게 설정
      ),
      child: Row(
        children: [
          const SizedBox(width: 13), // 출발역과 도착역 사이에 여백 추가

          Expanded(
            flex: 2, // 공간 비율 설정 (출발역 박스가 전체 Row의 2/5 차지)
            child: MiniSelectBox(
              title: '출발역', // 박스 제목을 '출발역'으로 설정
              station: departureStation, // 선택된 출발역 이름 전달 (null 가능)
              onTap: onDepartureTap, // 출발역 선택 버튼 클릭 시 실행할 함수 전달
            ),
          ),

          const Flexible(
            flex: 1,
            child: SizedBox(
              height: 50,
              child: VerticalDivider(
                width: 50, // 구분선의 너비 설정
                thickness: 2, // 구분선의 두께 설정
                color: Colors.grey, // 구분선 색상 설정
              ),
            ),
          ),

          Expanded(
            flex: 2, // 공간 비율 설정 (도착역 박스가 전체 Row의 2/5 차지)
            child: MiniSelectBox(
              title: '도착역', // 박스 제목을 '도착역'으로 설정
              station: arrivalStation, // 선택된 도착역 이름 전달 (null 가능)
              onTap: onArrivalTap, // 도착역 선택 버튼 클릭 시 실행할 함수 전달
            ),
          ),
        ],
      ),
    );
  }
}

// 개별적으로 출발역 또는 도착역을 표시하는 MiniSelectBox 위젯 정의
class MiniSelectBox extends StatelessWidget {
  const MiniSelectBox({
    super.key,
    required this.title, // 박스 제목 ('출발역' 또는 '도착역')을 받음. 필수값.
    required this.onTap, // 박스를 클릭했을 때 실행할 함수. 필수값.
    this.station, // 선택된 역 이름 (null 가능).
  });

  final String title; // 박스 제목 ('출발역' 또는 '도착역')
  final Function() onTap; // 박스를 클릭했을 때 실행될 함수
  final String? station; // 선택된 역 이름. 아직 선택되지 않았다면 null일 수 있음.

  @override
  Widget build(BuildContext context) {
    // 현재 테마의 ColorScheme 가져오기
    final colorScheme = Theme.of(context).colorScheme;
    /* 
    Theme.of(context).colorScheme:
    - 현재 앱의 테마에 맞는 색상 체계를 가져옴.
    - 라이트 모드와 다크 모드에 따라 자동으로 적절한 색상을 적용할 수 있음.
    */

    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.onSurface, // 테마에 따라 텍스트 색상 적용 (표면 위 텍스트 색상)
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          /* GestureDetector:
          - 터치 이벤트를 감지하는 위젯.
          - 사용자가 이 박스를 클릭하면 onTap 함수가 호출됨.*/

          child: Container(
            width: double.infinity,
            /* Container:
            - 역 이름 또는 '선택' 텍스트를 표시하는 컨테이너.
            - double.infinity로 너비를 최대화하여 화면 가로 끝까지 확장함.*/

            child: Text(
              station ?? '선택',
              /* 
              station ?? '선택':
              - 만약 station 값이 null이면 '선택'이라는 기본 텍스트를 표시함.
              - 사용자가 역을 아직 선택하지 않은 경우를 대비한 처리.
              */

              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: colorScheme.onSurface,
                /* 
                텍스트 색상:
                - 테마에 따라 텍스트 색상을 동적으로 변경함.
                - 라이트 모드에서는 어두운 색상(onSurface), 다크 모드에서는 밝은 색상이 적용됨.
                */
              ),
            ),
          ),
        ),
      ],
    );
  }
}

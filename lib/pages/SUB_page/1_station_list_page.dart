import 'package:flutter/material.dart'; // Flutter의 UI 구성 요소를 가져오는 패키지

// 기차역 리스트를 보여주고 선택할 수 있는 화면을 정의하는 StatelessWidget
class StationListPage extends StatelessWidget {
  @override
  final String title; // 화면 상단 제목 텍스트 (출발역 또는 도착역)
  final bool isDeparture; // 출발역인지 여부를 판단하는 변수 (true: 출발역, false: 도착역)
  final String? excludedStation; // 선택 목록에서 제외할 역 (중복 선택 방지)

  // 생성자: 필수 매개변수로 title과 isDeparture를 받고, excludedStation은 선택적 매개변수로 받음
  const StationListPage({
    super.key,
    required this.title, // 앱바에 표시될 제목
    required this.isDeparture, // 출발역인지 도착역인지 여부를 판단
    this.excludedStation, // 제외할 역 (null 가능)
  });

  @override
  Widget build(BuildContext context) {
    // 기차역 목록을 리스트로 정의
    List<String> stations = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산'
    ];

    // excludedStation으로 지정된 역은 리스트에서 제외 (중복 선택 방지)
    stations = stations.where((station) => station != excludedStation).toList();
    /* 
    - where 메소드를 사용하여 excludedStation과 일치하지 않는 역들만 필터링해서 새로운 리스트 생성.
    - 예를 들어, 사용자가 이미 출발역을 선택한 상태라면 그 역은 도착역 목록에서 제외됨.
    */

    return Scaffold(
      appBar: AppBar(
        title: Text(title), // 전달받은 title로 앱바의 제목 설정 (출발역 또는 도착역)
      ),
      body: ListView.separated(
        /* 
        ListView.separated:
        - 역 목록을 스크롤 가능한 리스트 형태로 표시.
        - 각 항목 사이에 구분선(Divider)을 추가하기 위해 separated 사용.
        */
        itemCount: stations.length + 1,
        /* itemCount:
        - 역 목록의 길이에 마지막 구분선을 위한 빈 항목 하나를 추가 (+1).
        - 이 빈 항목은 마지막에 여백을 추가하기 위한 용도. */

        separatorBuilder: (context, index) => Divider(
          /* separatorBuilder:
          - 각 리스트 항목 사이에 구분선을 추가.
          - 구분선의 색상과 두께는 조정 가능. 여기서는 연한 회색(Colors.grey[300])과 높이 0.5로 설정.*/
          color: Colors.grey[300],
          height: 0.5,
        ),
        itemBuilder: (context, index) {
          if (index == stations.length) {
            // 마지막 항목은 빈 컨테이너를 반환하여 리스트 끝에 여백 추가
            return Container();
          }

          return ListTile(
            /*  ListTile:
            - Flutter에서 자주 사용하는 리스트 항목 위젯.
            - 여기서는 각 기차역 이름을 표시하고, 클릭 시 해당 역을 선택할 수 있도록 함. */
            title: Text(
              stations[index], // 현재 인덱스에 해당하는 기차역 이름 표시
              style: TextStyle(
                fontSize: 18, // 글자 크기 설정
                fontWeight: FontWeight.bold, // 글자 두께 설정 (굵게)
              ),
            ),
            onTap: () {
              /*  onTap:
              - 사용자가 특정 역을 클릭했을 때 실행되는 함수.
              - Navigator.pop을 통해 현재 화면을 닫고, 선택된 역 이름(stations[index])을 이전 화면으로 반환. */
              Navigator.pop(context, stations[index]);
            },
          );
        },
      ),
    );
  }
}

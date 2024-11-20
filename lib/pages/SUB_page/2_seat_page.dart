import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 좌석 선택 페이지, 좌석 선택 상태(selectedSeat)가 변경될 수 있으므로 상태 변경이 가능한 StatefulWidget 사용
class SeatPage extends StatefulWidget {
  final String departureStation; // 출발역 정보를 전달받는 변수
  final String arrivalStation; // 도착역 정보를 전달받는 변수

  // 생성자: 출발역과 도착역을 필수로 받아서 초기화
  const SeatPage({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  // 상태 관리 로직을 분리하기 위해 createState 메서드 사용
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedSeat; // 선택된 좌석을 저장하는 변수 (초기값은 null)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'), // 페이지 상단의 제목을 '좌석 선택'으로 설정
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 페이지 전체에 여백을 추가
        child: Column(
          children: [
            // 출발역, 도착역, 화살표 아이콘을 Row로 배치 (flex를 사용하여 비율 설정)
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}

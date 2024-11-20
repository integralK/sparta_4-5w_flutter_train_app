import 'package:flutter/material.dart'; // Flutter의 기본 UI 구성 요소를 가져오는 패키지
import 'package:flutter_train_app/pages/SUB_page/2_seat_page.dart'; // 좌석 선택 페이지를 임포트

// 좌석 선택 버튼을 정의하는 SelectButton 위젯 (StatelessWidget)
class SelectButton extends StatelessWidget {
  final String? departureStation; // 선택된 출발역 이름 저장 (null 가능)
  final String? arrivalStation; // 선택된 도착역 이름 저장 (null 가능)

  // 생성자: 필수 매개변수로 departureStation과 arrivalStation을 받음
  const SelectButton({
    Key? key,
    required this.departureStation, // 출발역 값 (필수값, null 가능)
    required this.arrivalStation, // 도착역 값 (필수값, null 가능)
  }) : super(key: key); // 부모 클래스(StatelessWidget)의 생성자에 키 전달

  @override
  Widget build(BuildContext context) {
    // 버튼의 활성화 여부를 판단하는 논리식
    // 출발역과 도착역이 모두 null이 아니고, 빈 문자열이 아닐 때 버튼 활성화
    bool isEnabled = departureStation != null &&
        arrivalStation != null &&
        departureStation!.isNotEmpty &&
        arrivalStation!.isNotEmpty;
    /* isEnabled:
    - 출발역(departureStation)과 도착역(arrivalStation)이 모두 선택된 경우에만 true.
    - 두 값이 모두 null이 아니고, 빈 문자열이 아닐 때 버튼이 활성화됨. */

    return SizedBox(
      width: double.infinity, // 버튼의 너비를 화면 가득 채우도록 설정
      child: ElevatedButton(
        onPressed: isEnabled
            ? () {
                /*  Navigator.push:
                - 사용자가 버튼을 클릭했을 때 실행되는 함수.
                - Navigator.push를 사용하여 SeatPage로 이동하고, 출발역과 도착역 정보를 전달함. */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatPage(
                      departureStation: departureStation!,
                      /* SeatPage로 출발역 값을 전달.
                      '!'는 null이 아님을 보장하는 의미로 사용됨. */
                      arrivalStation: arrivalStation!,
                      /*  SeatPage로 도착역 값을 전달.
                      '!'는 null이 아님을 보장하는 의미로 사용됨. */
                    ),
                  ),
                );
              }
            : null,
        /* onPressed:
            - 버튼이 활성화(isEnabled == true)되었을 경우에만 작동.
            - 만약 isEnabled가 false라면 onPressed는 null로 설정되어 버튼이 비활성화됨. */

        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          /* minimumSize:
          - 버튼의 최소 크기를 설정. 여기서는 너비를 화면 가득 채우고 높이를 45로 설정함.*/

          backgroundColor: isEnabled ? Colors.purple : Colors.grey,
          /* backgroundColor:
          - isEnabled가 true일 때는 보라색(Colors.purple), false일 때는 회색(Colors.grey)으로 설정.
          - 즉, 출발역과 도착역이 선택되지 않으면 회색으로 비활성화된 버튼처럼 보임.*/

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // 버튼 모서리를 둥글게 설정 (20픽셀 반경)
          ),
        ),
        child: Text(
          '좌석 선택', // 버튼 안에 표시될 텍스트
          style: const TextStyle(
            color: Colors.white, // 텍스트 색상은 흰색으로 고정
            fontSize: 18, // 글자 크기 설정
            fontWeight: FontWeight.bold, // 글자를 굵게 표시
          ),
        ),
      ),
    );
  }
}

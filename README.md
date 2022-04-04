## 목차
- [소개](#소개)
- [요약](#요약)
- [기능 상세 설명](#기능-상세-설명)


## 소개
스마트 헬스케어 스타트업 <a href="https://www.injewelme.com/">인절미</a> 코딩 테스트 과제 입니다.




## 요약

| Index | Detail                                                                                                                          |
|-------|---------------------------------------------------------------------------------------------------------------------------------|
| 구현 영상 | https://www.youtube.com/watch?v=M-s1s4f8q8s                                                                                     |
| 구현 기간 | **2022.4.3(하루)**                                                                                                                |
| 기술 스택 | Flutter                                                                                                                         |
| 구현 목표 | - 디자인 명세에 맞게 UI 구현  <br> - ListView를 활용 <br/> - 그래프에 애니메이션 추가                                                                   |
| 구현 기능 | - ListView 기반 Table Widget UI <br> - MVVM 아키텍쳐 기반 Heart Icon Toggle 로직 <br> - `setState` 을 사용하지 않고 UI 인터렉션 구현(렌더링 최소화)<br> - 반응형 레이아웃 <br> - 특정 Widget의 포지션을 감지하여 그래프 애니메이션 실행 <br> - Networking을 고려한 데이터 모델링


## 기능 상세 설명 

###1. setState 을 사용하지 않고 UI 인터렉션 구현(렌더링 최소화) <br>
- 프로젝트의 규모가 크지 않아서 Statefull Widget의 `setState`을 사용해도 퍼포먼스에 무리가 없지만 확장성을 고려해 `setState`사용을 지양했습니다.
- 상태관리 라이브러리(Getx)를 사용하여 필요한 UI 인터렉션들을 구현했습니다.


###2. 특정 Widget의 포지션을 감지하여 그래프 애니메이션 실행 <br>
- 그래프가 화면 하단에 위치하고 있기 때문에 유저가 그래프를 확인하기 전에 애니메이션이 실행되는 이슈가 있었습니다.
- Scroll Position을 감지하여 애니메이션을 실행시킬 수 있는 방법도 있지만 매번 Scroll Event값을 감지하기 때문에 성능에 과부하가 생깁니다.
- 이슈를 해결하기 위해 특정 Widget을 감지하여 애니메이션 이벤트를 실행시키는 로직을 구상했습니다.<br>
<img width="300" alt="detective2" src="https://user-images.githubusercontent.com/75591730/161453798-7244e2cb-2687-434d-9b16-b1ed15e0f4d2.png">
<br>
- `1번` Container Widget이 화면에 보여질 때 Bar 차트 애니메이션 실행
- `2번` Container Widget이 화면이 보여질 때 Pie 차트 애니메이션 실행
  
###3. Networking을 고려한 데이터 모델링
- 본 프로젝트에서는 서버와 Networking은 하지 않았지만 추후 Netwokring을 고려한 데이터로 로직을 설계했습니다.
```dart
// Meal 모델
class Meal {
  int id;
  int mealTime; // 조식, 중식, 석식
  String mealName; 
  int mealType; // 밥류, 국류, 반찬류 등등
  List<String> mealIngredient;
  int gram;
  int kcal;

  Meal(this.id, this.mealTime, this.mealName, this.mealType,
      this.mealIngredient, this.gram, this.kcal);
  
  // 인스턴스 ( 1100 -> 조식, 11100 -> 국류)
  Meal(12312, 1100, "열무보리국", 11100, ["보리", "열무"], 320, 294),
}
```
```dart
/* Defaults */
const Map<int, String> mealTimeDefaults = {
  1011: "조식",
  1100: "중식",
  1101: "석식",
};

const Map<int, String> mealTypeDefaults = {
  11011: "밥류",
  11100: "국류",
  11101: "반찬류",
  ...
};
```
- 식단의 종류와 식단 시간에 대한 값을 가지고 있는 인스턴스 자료형을 DB 크기를 많이 차지하지 않는 Int 자료형으로 데이터를 모델링 하였습니다.
- 이후 key, value 형태로 매핑되어 있는 객체를 통해 필요한 데이터를 화면에 보여줍니다. (이때 키값은 Binary형으로 표현)

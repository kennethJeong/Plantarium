# Plantarium
교육, 연구, 오픈마켓 등 다양한 목적을 위한 식물 정보 공유 iOS 앱 개발

### Overview 
- 전 세계 식물의 종은 수십만개에 달한다. 더불어 그 하위 분류까지 모두 합한다면 쉽게 헤아릴 수 없을 정도로 많은 수의 식물이 존재한다.
- 하지만, 현재 전세계 어디에도 이 많은 수의 식물을 한데 모아놓아놓은 연구 자료는 존재하지 않는다. 그렇기에 첫 시도는 교육 및 연구 자료로서 활용 가능한 식물 사전 앱을 만드는 것이다.
- 첫번째 타겟은 식충 식물(Insectivorous Plants) 25종으로 설정했다. 그리고 각 종의 형태(Morphology)를 꽃(Flower), 열매(Fruit), 잎(Leaf), 뿌리(Root), 줄기(Stem), 계(System) 으로 구별하였다.
</br>
<table>
  <tr>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217489012-9717da35-442a-4ada-8589-f728db553b09.png">
    </td>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217491378-7dc88a5f-fb03-479f-9f57-3de2d38257b2.png">
    </td>
  </tr>
</table>
</br>

- 각 식물의 이미지를 Morphology에 따라 나눠 따로 생성하여, 앱 사용자로 하여금 버튼 혹은 제스쳐를 통해 식물의 구성을 직접 보고 경험할 수 있게 하였다.
- 모든 UI는 Adobe XD로 만들어진 Sample UI를 참고하여 제작하였다.
<table>
  <tr>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217760945-1bd7d185-b03e-4f39-b0db-6377c76aa083.png">
    </td>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217761879-5de86934-4cfc-4cdf-b1b0-de92c688438e.png">
    </td>
  </tr>
</table>
<table>
  <tr>
    <td>
      <img width= "300px" alt="image" src="https://user-images.githubusercontent.com/41365432/217764272-096fabf6-5dd6-4f59-889b-5a3330b22309.png">
    </td>
    <td>
      <img width= "300px" alt="image" src="https://user-images.githubusercontent.com/41365432/217764387-e4df349d-b234-4f37-aa87-7e89093a2f64.png">
    </td>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217762177-453d3326-85f3-465a-9b6f-36f77b430957.gif">
    </td>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217763196-4b8669b7-bf21-44a9-b16f-b3faa24baa8b.gif">
    </td>
    <td>
      <img alt="image" src="https://user-images.githubusercontent.com/41365432/217762106-a87c839c-0d9f-481c-9094-4dab84d983c3.gif">
    </td>
  </tr>
</table>
</br>
- 실시간 데이터 처리를 위해 DB는 Realm을, 각 식물의 서식지를 지도상에 표현하기 위해 MapBox 패키지를 사용하였다.
</br>
- 또한, 교육 및 연구 목적 외에도 실내 공간에서 식물을 키우는 '플랜테리어(Plnaterior)', 국가 및 대륙 간 식물 거래 중개 등의 기능을 추가할 것이다.
<img alt="image" src="https://user-images.githubusercontent.com/41365432/217765197-611f88f8-0861-4797-b6b2-5a53720f786b.jpeg">

</br>
</br>

### Version
- MapBox SDK : 6.3.1
- Realm-Swift : 3.15.0

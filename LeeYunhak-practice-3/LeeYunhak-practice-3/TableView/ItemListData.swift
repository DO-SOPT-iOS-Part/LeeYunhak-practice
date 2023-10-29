//
//  ItemListData.swift
//  LeeYunhak-practice-3
//
//  Created by 이윤학 on 10/28/23.
//

public struct ItemListData {
    let image: String
    let item: String
    let location: String
    let price: String
    var isLike: Bool
    
    init(image: String, item: String, location: String, price: String, isLike: Bool) {
        self.image = image
        self.item = item
        self.location = location
        self.price = price
        self.isLike = isLike
    }
}

public var itemListData: [ItemListData] = [
    .init(image: "image1",
          item: "외장하드",
          location: "노원구 중계2.3동",
          price: "60,000원",
          isLike: false),
    .init(image: "image2",
          item: "게이밍 의자",
          location: "노원구 상계 8동",
          price: "30,000원",
          isLike: false),
    .init(image: "image3",
          item: "노트북 팝니다",
          location: "노원구 상계9동",
          price: "120,000원",
          isLike: true),
    .init(image: "image4",
          item: "닌텐도 이카드 리더기 이사가야해서 잡동사니 급처해요 아무나 사가주시면 너무 감사할거같은데 그쪽도 자겁치까를    아세요?",
          location: "의정부시 송산2동",
          price: "50,000원",
          isLike: true),
    .init(image: "image1",
          item: "외장하드",
          location: "노원구 중계2.3동",
          price: "60,000원",
          isLike: false),
    .init(image: "image2",
          item: "게이밍 의자",
          location: "노원구 상계 8동",
          price: "30,000원",
          isLike: false),
    .init(image: "image3",
          item: "노트북 팝니다",
          location: "노원구 상계9동",
          price: "120,000원",
          isLike: true),
    .init(image: "image4",
          item: "닌텐도 이카드 리더기 이사가야해서 잡동사니 급처해요 아무나 사가주시면 너무 감사할거같은데 그쪽도 자겁치까를 아세요?",
          location: "의정부시 송산2동",
          price: "50,000원",
          isLike: true)
]

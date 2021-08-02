class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物、本・音楽・ゲーム' },
    { id: 6, name: 'おもちゃ・ホビー・グッズ、家電・スマホ・カメラ' },
    { id: 7, name: 'スポーツ・レジャー' },
    { id: 8, name: 'ハンドメイド' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

  end
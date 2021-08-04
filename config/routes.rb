Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resoucesメソッドはrailsで定義されている7つのアクションのルーティングを自動で生成するメソッド resousesメソッドを使うことで簡単にルーティングを作成することができる
  #resources :コントローラー名
  #データベースと連動して使う場合はコントローラー名は複数形になるrailsのルール
  resources:articles
  #    url     コントローラー名#アクション名   views/topの中のhtmlはアクション名と同じにすること
  get 'top' => 'top#index'
  #get 'top' => 'top/index'
  #ルートの書き方が違う
  #間を # で区切るのは root でトップページを指定する部分だけで
  #それ以外は / で区切る
  root 'top#index'
end


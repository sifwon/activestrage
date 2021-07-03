class Article < ApplicationRecord
    belongs_to :user
    #prisenceはオブジェクトが存在すればオブジェクトを返し、オブジェクトが存在しなければnilを返す 
    #validatesはオブジェクトがDBに保存される前にそのデータが正しいかどうかを検証する仕組み 
    #rubyでのlengthは文字列の長さを表す 
    #erbファイルしか<%=%>は使えない
    validates :title,presence: true,length: {minimum: 5}
end

class TopController < ApplicationController
    # views/topのhtml名と同じにすること
    # controllerで定義されるメソッドをアクションという
    def index
        #インスタンス変数
        @rem="Railsブログへようこそ"
    end    
end

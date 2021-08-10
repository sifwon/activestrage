class ArticlesController < ApplicationController
    #only onryと書かないように
    before_action :set_article ,only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    def index
        #@articles = Article.all
        @articles = current_user.articles
    end
    def show
        
    end
    def new
        @article = Article.new
    end
    def edit
    end
    def create
        #paramsは送られてきた値を受け取るためのメソッド 送られてくる情報は主に、getのクエリパラメータとPostでformを使って送信されるデータの2つ
            #render plain: params[:article].inspect
            #raise params.inspect
        #paramsのアーティクルの中からモデル(Article.new)を作りそれをインスタンス変数(@article)に入れる そしてそれを保存
        @article=Article.new(article_params)
        @article.user = current_user
        #データベースに保存
        if @article.save
            #保存されたあとどこに行くか
            redirect_to article_path(@article)
        #renderメソッドとは、呼び出すテンプレート（ビュー）ファイルを指定するメソッドです。コントローラー・ビューどちらでも使うことができます。
        else
            render 'new'
        end
    end
    def update 
        
        if @article.update(article_params)
            redirect_to @article
        else 
            render edit
        end
    end
    def destroy
        
        @article.destroy
        redirect_to @article
    end 
    def article_params
        #articleと言うパラメーターの中のtitle,textは保存していいですよと言う意味
        params.require(:article).permit(:title, :text,:image)
    end
    def set_article
        #Articalモデルの中で見つけてくる 
        #インスタンス変数の中に入れることでviewで使えるようになる
        @article = Article.find params[:id]
    end
    
end

class BlogsController < ApplicationController
  def index
    # 保存されているデータ(タイプ)を全て取得
    @blogs = Blog.all
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @blog = Blog.new
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @blog = Blog.new
  end

  def show
    # テーブルからレコードを1行取得。引数はid
    @blog = Blog.find(params[:id])
  end

  def create
    # blog_parameter メソッドで必要な属性を取得し、その属性を持つ新しいブログ記事をデータベースに保存する。
    Blog.create(blog_parameter)
    # ブログ記事の作成が完了した後に一覧ページにリダイレクト
    redirect_to blogs_path
  end

  def destroy
    # テーブルからレコードを1行取得。引数はid
    @blog = Blog.find(params[:id])
    # ブログ記事を削除した時に
    @blog.destroy
    # ブログ記事の削除が完了した後に一覧ページにリダイレクト
    redirect_to blogs_path
  end

  def edit
    # テーブルからレコードを1行取得。引数はid
    @blog = Blog.find(params[:id])
  end

  def update
    # テーブルからレコードを1行取得。引数はid
    @blog = Blog.find(params[:id])
    # もしアップデートに成功した時
    if @blog.update(blog_parameter)
      # 一覧ページにリダイレクト
      redirect_to blogs_path
    else
      # elseの場合、編集ページを表示
      render 'edit'
    end
  end

  private

  def blog_parameter
    # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
    params.require(:blog).permit(:title, :content, :start_time)
  end

end
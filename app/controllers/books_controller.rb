require 'open-uri'
class BooksController < ApplicationController

  def index
    @user = current_user
    @books = @user.books
    respond_to do |format|
      # format.html { render :index }
      format.json { render json: @books }
    end
  end

  def create
    @book = Book.new(book_params)
    @book.title = Book.get_title(@book.isbn)
    @book.user_id = params[:user_id]
    if @book.save
      render json: @book
    else
      render status: 400, nothing: true
    end
  end

  def show
    @book = Book.find(params[:id])
    isbn_num = @book.isbn
    render json: {
      title: @book.title,
      isbn: @book.isbn,
      prices: [
        {site: 'chegg', url: "http://www.chegg.com/selltextbooks/search?buyback_search=+#{isbn_num}", price: Book.scrape_chegg(isbn_num)},
        {site: 'bookbyte', url: "http://www.bookbyte.com/buyback2.aspx?isbns=#{isbn_num}", price: Book.scrape_bookbyte(isbn_num)},
        {site: 'textbookmaniac', url: "http://buyback.textbookmaniac.com/search?isbn=#{isbn_num}", price: Book.scrape_textbook_maniac(isbn_num)},
        {site: 'cash4books', url: "http://www.cash4books.net/main.php?isbn=#{isbn_num}", price: Book.scrape_cash4books(isbn_num)}
      ].sort_by { |hsh| hsh[:price] }.reverse
    }
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    if @book.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :img_url)
  end

end

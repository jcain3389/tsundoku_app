class Book < ActiveRecord::Base
  belongs_to :user

  def Book.get_title(number)
    url = "http://www.chegg.com/selltextbooks/search?buyback_search=+#{number}"
    doc = Nokogiri::HTML(open(url))
    title = doc.at_css("span.txt-hdr-sec").text
    return title
  end

  def Book.scrape_chegg(isbn_num)
    url = "http://www.chegg.com/selltextbooks/search?buyback_search=+#{isbn_num}"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css("div.txt-body-bold.digit").text.gsub('$', '').to_f
    return price
  end

  def Book.scrape_bookbyte(isbn_num)
    url = "http://www.bookbyte.com/buyback2.aspx?isbns=#{isbn_num}"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css("span#ctl00_ContentPlaceHolder1_lblTotal").text.gsub('$', '').to_f
    return price
  end

  def Book.scrape_textbook_maniac(isbn_num)
    url = "http://buyback.textbookmaniac.com/search?isbn=#{isbn_num}"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css("span.price").text.gsub('$', '').to_f
    return price
  end

  def Book.scrape_cash4books(isbn_num)
    url = "http://www.cash4books.net/main.php?isbn=#{isbn_num}"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css("span#in-your-cart-grandtotal.pull-right").text.gsub('$', '').to_f
    return price
  end
end

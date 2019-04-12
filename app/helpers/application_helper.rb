module ApplicationHelper
  #ハイライトメソッドにテキストを渡す際、絶対検索した際のクオーテーションを消すようにする
  def check_for_quotations(keyword)
    keyword.match(/".+"/)
  end

  def remove_quotations(keyword)
   return keyword.gsub(/^./, "").gsub(/.$/, "")
  end

  def display_search_word(keyword)
    if check_for_quotations(keyword)
      remove_quotations(keyword)
    else
      return keyword
    end
  end

  def modify_text_for_highlight(keyword)
    if check_for_quotations(keyword)
      remove_quotations(keyword)
    elsif keyword.match(//)
      keyword.split(/\s/).reject {|word| word.length == 1 }
    else
      return keyword
    end
  end
end

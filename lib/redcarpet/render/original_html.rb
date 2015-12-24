# Markdownを改変
class Redcarpet::Render::OriginalHTML < Redcarpet::Render::HTML
  # H1は使用できないようにする。
  def header(text, level)
    level += 1
    "<h#{level}>#{text}</h#{level}>"
  end

  # カスタマイズを行う。
  def postprocess(full_document)
    # テーブルをbootstrapに合わせる。
    full_document.gsub("<table>", '<table class="table">')
  end
end
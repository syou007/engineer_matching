# 位置づけ的にこの場所に配置しているが、すべてのコントローラーで使用できる。
module Public::MarkdownHelper
  # マークダウンエディターの作成
  def markdown_editor(&block)
    render partial: "public/markdown/markdown_editor", object: block
  end
end

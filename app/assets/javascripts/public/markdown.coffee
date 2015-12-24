# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Markdownで切り替える処理
$ ->
  # 編集用のdivを表示する
  $(document).on 'click', '#markdown-edit-link', ->
    $("#markdown-edit-view").delay(100).fadeIn(100)
    $("#markdown-preview-view").fadeOut(100)
    $('#markdown-preview-link').removeClass('active')
    $(@).addClass('active')
    return false

  # プレビュー用のdivを表示する
  $(document).on 'click', '#markdown-preview-link', ->
    # 入力データをパースして表示する。
    $.ajax({
      url: $(@).attr("preview-url"),
      method: 'POST',
      data: {markdown_text: $("#markdown-edit-view textarea").val()},
      success: (response) ->
        if response.status is 'ok'
          $("#markdown-preview-view").html(response.markdown)
      })
    $("#markdown-preview-view").delay(100).fadeIn(100)
    $("#markdown-edit-view").fadeOut(100)
    $('#markdown-edit-link').removeClass('active')
    $(@).addClass('active')
    return false

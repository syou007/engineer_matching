# エンジニアマッチングサイトのサンプル

## はじめに
本プログラムコードはエンジニアマッチングサイトを作る際のひな形に使えるかな・・・。  
と思って作成してます。

まだ作ってる途中ですが、プログラムコードはご自由に使用してください。  
（もちろん、問題が発生しても責任は取りません。）

※作り続けるかどうかも不明・・・

## 構築
構築は以下の手順で行えます。

```sh
$ git clone https://github.com/syou007/engineer_matching.git
$ cd engineer_matching
```

DB接続の設定

```sh
$ cp .env_base .env
```

コピーした`.env`の中身を書き換えてください。

以下を実施して起動してください。

```sh
rake db:create
rake db:migrate
rails s
```

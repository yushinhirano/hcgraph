High Chart Graph
===========================

* HCGraph α版。

# 概要

Hight Chartを使ったグラフを簡単に見るためのWebUIツール。

High Chart
* http://www.highcharts.com/

ページはTwitter Bootstrapを利用して作成しています。
* http://twitter.github.io/bootstrap/

簡単にファイル置いて簡単にグラフ化したいがために作ったもの。
そしてどうせ見るなら味のないグラフよりリッチなグラフで見たいから、HighChartを利用しています。


# 実行環境

* CentOS 6.x
* ruby 1.8.x
* Apache 2.2.x

テストしたのが上記のバージョンというだけ。
恐らくRuby 1.9以上でも動作する。

Apacheは、rubyスクリプトをcgiとして起動できるWebサーバであれば特に問題ない。
Apache固有の機能などは特に使っていない。


## インストール

1. 適当な場所に展開する。ディレクトリは問わない。
    * Apacheにインストールする場合。
        * アプリ格納先のhcgraph/cgi/index.cgi、graph_view.cgiについて、Apacheの設定でcgiの実行を許可すること。
        * ユーザのHOMEディレクトリを公開して実行するか、
          /var/www/cgi-bin/など、デフォルトでcgi実行が許可されている場所を使う。
          作成者はいつもユーザのHOMEの特定ディレクトリでcgi実行可能であるように公開している。
2. グラフ化したいデータを適当なディレクトリに置く。データはカラムごとにタブ区切りであること。
3. conf/以下のコンフィグファイルを適当にいじってビューの定義を行う。


## ビューの閲覧

* CGI実行を許可したhcgraph/cgi/index.cgiをWebブラウザで閲覧すればよい。
* ChromeかFireFox、Safariくらいで動作確認済み。IEで動作しないことを確認済み。IEお断り。

## グラフコンフィグの記述。

* データファイルパス、データカラム、ヘッダの使用、グラフ形式などのパラメータ、及びどのページで参照するかを記述する。
* confの下にall_view_index.conf.yamlがあり、このファイルは固定。
* GraphViewメニューへの参照を定義している。
* 以下、rubyのyamlをご存じであれば、後はデフォルトのサンプルを見ればカスタマイズは容易でしょう。




## その他

### CentOS && Apache上で実行する方法

* CentOS6.X、Apache 2.Xで特定のユーザディレクトリで公開する場合。
  ドキュメントルート/var/www/htmlとかを利用しないで行いたかった時のメモ。

* 公開専用のユーザを作成する
* hcgraphを適当に展開する。
* ユーザのホームディレクトリ～hcgraphディレクトリまで、otherユーザにREAD権限をつける。
  かつ、OWNER以外にWRITE権限をつけない必要もあるので、0755くらいにしておく。
* hcgraph/cgi/index.cgi、graph_view.cgiに、otherユーザに実行権限をつけて、かつOWNER以外にWRITE権限をつけない。
  OWNER以外にWRITE権限をつけると、suexecに後で怒られるので。

*  /etc/httpd/conf/httpd.confを編集する。

1. disabledをコメントアウト、public_htmlをコメントイン。
	<IfModule mod_userdir.c>
	    #
	    # UserDir is disabled by default since it can confirm the presence
	    # of a username on the system (depending on home directory
	    # permissions).
	    #
	#    UserDir Sites
	
	    #
	    # To enable requests to /~user/ to serve the user's public_html
	    # directory, remove the "UserDir disabled" line above, and uncomment
	    # the following line instead:
	    #
	    UserDir public_html
	
	</IfModule>

2. 以下の部分をコメントイン。
	AddHandler cgi-script .cgi

3. 適当な場所に追加。
	<Directory /home/*/public_html/*/cgi>
	    Options ExecCGI
	</Directory>

* httpdをrestartかreloadして、以下のURLでアクセスしてみる。
  http://{ドメイン名}/~{ユーザ名}/hcgraph/cgi/index.cgi

* このバージョンでは、なぜかpublic_html以外のディレクトリを公開しようとすると、suexecの仕様なのかエラーにされる。
  あえて変える必要がなかったのでこのままにしたが・・・むぅ。




### グラフコンフィグの詳細な記述方法

* いずれ書くかも。どの道まだ作っては仕様変えてる段階なので、もうちょっと固まるまで未記載。


* ご意見、ご感想、ご質問はyushin2494@gmail.comにどうぞ。


### 言い訳

* Ruby使い始めて10000stepも書いてない初心者なので厳しい突っ込みを歓迎します。
* なんでRailsにしないのと言われたら、インストールが非常に面倒になる上に向こうのバージョンに依存したくないから。
  それに、Railsの機能とか生産性を必要とするほどのものでもないから。
  *置けば動く*、これ理想。インストールと運用は簡単にしたい。









### TODO

* Admin画面で運用をもっと楽に。
    * ヘルプもAdminで参照できるように。
* データベースをそのまま参照できるように。（DB接続のRubyGemsに依存したくない・・・）






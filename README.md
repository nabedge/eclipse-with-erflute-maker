# eclipse-with-erflute-maker

## このスクリプトは以下のことを実行します

1. eclipse-oxygen(JavaEE)をダウンロード
2. ERFluteプラグインのjarをダウンロード
3. eclipseのdmgパッケージを展開し、ERFluteプラグインおよびそれが稼働するために必要なプラグインをインストール

## 展開されたeclipseを実行する方法

open ./target/Eclipse.app

## eclipseでErmを読み込むために

1. 画面上部の `File` → `Import...` をクリック
2. 新しく出てくるウィンドウ内で `Maven` を展開し `Existing Maven Projects` をクリック
3. インポートしたいディレクトリを `Browse...` をクリックして指定し、指定したプロジェクトファイル配下の `pom.xml` にチェックを入れ `finish` をクリック
4. 色々インポートしてくれていると思うので落ち着いたら改めて画面上部の `File` → `Open File...` をクリック
5. 開きたい拡張子が `.erm` を指定して `Open` をクリック

_開けないとかがある場合は、eclipse.iniなどで指定しているメモリサイズとかを確かめてみてください。_

## see also'

* <http://dbflute.seasar.org/ja/manual/function/helper/erflute/index.html>

## LICENSE

* This code is under MIT License.


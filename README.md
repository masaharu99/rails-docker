# Docker で Rails + PostgreSQL 環境を構築する

## 使用するバージョン

- ruby 3.2.2
- rails 7.0.6
- postgresql 12.0

## 構築手順

### GitHub からプロジェクトをクローンする

プロジェクトを作成したいディレクトリで下のコマンドを実行する。

```
git clone https://github.com/masaharu99/rails-docker.git
```

### コンテナのイメージを構築する

ターミナルでクローンしたプロジェクトのディレクトリに移動する。<br>
次のコマンドでコンテナをビルドする。

```
docker compose build
```

### コンテナを起動して DB を用意する（初回起動のみ）

次のコマンドで DB を作成する。

```
docker compose run web rake db:create
```

DB 作成後、プロジェクトの DB 定義を PostgreSQL に反映する。

```
docker compose run web rails db:migrate
```

この一連の手順は最初の一回のみ実行します。
コンテナを削除しても、`postgresql_volume`ボリュームが存在すれば大丈夫。<br>
ボリュームの確認の仕方は[こちら](#label)を確認する。

### 動作確認

次のコマンドでアプリケーションを起動する。

```
docker compose up
```

ブラウザで`localhost:3000`にアクセスして、下の画面が表示されれば成功。

<img src= "app_image.png" width="60%" >

<a id="label"></a>

### ボリュームの確認方法

下のコマンドでボリューム一覧を表示する。
VOLUME NAME に`rails-docker_postgresql_volume`が表示されていれば、DB の初回手順は不要。

```
$ docker volume ls

DRIVER    VOLUME NAME
local     rails-docker_postgresql_volume
```

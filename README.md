# バッテリーの充電しすぎ通知

## 目的
Macのバッテリーを40%から80%に保つように通知を行います。でも、普通は無料アプリを使ったほうが便利だと思います。

## 環境
Macを想定

## launchdによる定期的な実行方法
設定ファイルを```~/Library/LaunchAgents/```下に配置して、下記のコマンドを実行してください。

```
launchctl load ~/Library/LaunchAgents/battery-notifier-sample.plist
```

ファイル名は任意です。

## 必要なツール
### terminal-notifierコマンド
Ruby製のツールなので下記の通りgemインストールする必要があります。

```
gem install terminal-notifier
```

もしくは

```
brew install terminal-notifier
```

## 注意

Macで表示されている電池残量と差があります。
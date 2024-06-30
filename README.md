# vscode_devcontainer_almalinux8

## 概要
* VSCode の DevContainer を Docker Compose で構築する
* DevContainer 用のイメージではなく、素の AlmaLinux8 から自前で構築する
* 一般ユーザーを追加し、sudo が使えるようにする
* Remote-SSH からも使えるようにする

## TODO
* SSH のキーの永続化

## 参照
* Development Containers Images  
  https://github.com/devcontainers/images  

* Dev Containerを使ってみよう  
  https://zenn.dev/bells17/articles/devcontainer-2024  

* dockerhub - almalinux  
  https://hub.docker.com/_/almalinux  

* [VS Code] 一般ユーザーで起動中のコンテナを接続する  
  https://zenn.dev/above/articles/f09f5acf64cde7  

* Dockerコンテナに一般ユーザーを追加するときのDockerfileの設定  
  https://qiita.com/Spritaro/items/602118d946a4383bd2bb  
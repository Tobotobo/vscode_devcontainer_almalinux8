#!/bin/bash

# -x: 実行したコマンドと引数も出力する
# -e: スクリプト内のコマンドが失敗したとき（終了ステータスが0以外）にスクリプトを直ちに終了する
# -E: '-e'オプションと組み合わせて使用し、サブシェルや関数内でエラーが発生した場合もスクリプトの実行を終了する
# -u: 未定義の変数を参照しようとしたときにエラーメッセージを表示してスクリプトを終了する
# -o pipefail: パイプラインの左辺のコマンドが失敗したときに右辺を実行せずスクリプトを終了する 
set -eEuo pipefail
shopt -s inherit_errexit # '-e'オプションをサブシェルや関数内にも適用する

ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
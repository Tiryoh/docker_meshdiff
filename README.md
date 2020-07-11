# docker_meshdiff

[nomumu/meshdiff](https://github.com/nomumu/meshdiff)をDockerで起動できるようにするためのDockerfileです

meshdiff自体の使い方に関しては[本家のREADME](https://github.com/nomumu/meshdiff/blob/master/README.md)を参照してください

## 使い方

### 1. 対象リポジトリのダウンロード

`--mirror`オプションをつけて対象としたいリポジトリ（STLのdiffを見たいGitリポジトリ）を`git clone`します。  
この例では`/tmp`ディレクトリに[rt-net/crane_x7_ros](https://github.com/rt-net/crane_x7_ros)ダウンロードします。

```sh
cd /tmp
git clone --mirror https://github.com/rt-net/crane_x7_ros.git
```

### 2. 対象リポジトリ内でdockerコンテナを起動

`git clone --mirror`でダウンロードしたリポジトリの中で以下のコマンドを実行します。

```sh
docker run --rm -p 8080:80 -v $(pwd):/work -e UID=$(id -u) -e GID=$(id -g) tiryoh/meshdiff
```

Dockerコンテナの起動時に[GitのPackfile](https://git-scm.com/book/ja/v2/Git%E3%81%AE%E5%86%85%E5%81%B4-Packfile)を自動で展開するようにしています。

### 3. Webブラウザでmeshdiffを起動

Chrome等のWebブラウザで http://127.0.0.1:8080 にアクセスしてmeshdiffを開きます。  
「Gitデータロード」をクリックするとロードが始まります。ロードには少々時間がかかる場合があります。

![Image from Gyazo](https://i.gyazo.com/4e592cb7c1a5f678b6e7ec90b93852ea.gif)

## LICENSE

(C) 2020 Daisuke Sato

This repository is released under the MIT License, see [LICENSE](./LICENSE).  

### Acknowledgements

* nomumu/meshdiff
    * Copyright (c) 2020 nomumu
    * [The MIT License](https://github.com/nomumu/meshdiff/blob/8dfcd407add55a72872a95886e25c340c5bb872e/LICENSEE)
* mrdoob/three.js
    * Copyright © 2010-2020 three.js authors
    * [The MIT License](https://github.com/mrdoob/three.js/blob/r118/LICENSE)
* imaya/zlib.js
    * Copyright (c) 2012 imaya
    * [The MIT License](https://github.com/imaya/zlib.js/blob/0.3.1/LICENSE)

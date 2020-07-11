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

## LICENSE

(C) 2020 Daisuke Sato

This repository is released under the MIT License, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the MIT License.

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

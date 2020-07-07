# デバッグの種類
* debugモジュールを使用する
* ansible-playbookのオプション「-v(-verbose)」を使用する
* Playbook Debuggerを使用する
* リモート実行ファイルを確認する

# 1. debugモジュールを使用する
[register]に登録された内容を確認する際に，よく使用される．

## -タスク定義
例えば`/var/lib/mysql ディレクトリの存在を確認` したい場合

```YAML
- name: check directory exists
  stat:
    path: /var/lib/mysql
  register: res_exists

- name: debug var res_exists
  debug:
    msg: "{{ res_exists }}"
```

## -存在した場合の出力
```yml
TASK [debug var res_exists] *********************************************************************
ok: [sample_node1] => {
    "msg": {
        "changed": false,
        "failed": false,
        "stat": {
            "atime": 1539078759.2616446,
            "attr_flags": "",
            "attributes": [],
            "block_size": 4096,
            "blocks": 0,
            "charset": "binary",
            "ctime": 1539257220.6302285,
            "dev": 64768,
            "device_type": 0,
            "executable": true,
            "exists": true,
            "gid": 993,
            "gr_name": "mysql",
            "inode": 101087109,
            "isblk": false,
            "ischr": false,
            "isdir": true,
            "isfifo": false,
            "isgid": false,
            "islnk": false,
            "isreg": false,
            "issock": false,
            "isuid": false,
            "mimetype": "inode/directory",
            "mode": "0751",
            "mtime": 1539257220.6302285,
            "nlink": 3,
            "path": "/var/lib/mysql",
            "pw_name": "mysql",
            "readable": false,
            "rgrp": true,
            "roth": false,
            "rusr": true,
            "size": 18,
            "uid": 996,
            "version": null,
            "wgrp": false,
            "woth": false,
            "writeable": false,
            "wusr": true,
            "xgrp": true,
            "xoth": true,
            "xusr": true
        }
    }
}
```

## -存在しない場合の出力
```yml
TASK [debug var res_exists] *********************************************************************
ok: [sample_node1] => {
    "msg": {
        "changed": false,
        "failed": false,
        "stat": {
            "exists": false
        }
    }
}
```

## whenとの併用
以降の処理で，存在しない場合に実行したいタスクがあれば
```yml
when: res_exists.stat.exists == false
```
とすれば良いと判断できる．\
存在する場合には，オーナーや権限，ディレクトリであるかを確認したりする情報が含まれているので，これらの情報を以降の処理で使用することもできる．
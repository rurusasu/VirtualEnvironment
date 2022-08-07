# conda create をしたときに **Verifying transaction: failed** が発生した場合

REF: https://datascience.stackexchange.com/questions/41732/conda-verification-failed

`Verifying transaction: failed` 以下にパッケージ名が表示される。

```cmd
Proceed ([y]/n)? y
Preparing transaction: done
Verifying transaction: failed

CondaVerificationError: The package for libffi located at /opt/conda/pkgs/libffi-3.3-he6710b0_2 appears to be corrupted.
```

1. このパッケージをすべてメモし、`/opt/conda/pkgs/` に移動．
1. 手動でメモしたパッケージをすべて削除．
1. `conda install -f {package-name}` で削除したパッケージを1つずつ再インストールする。
1. すべて再インストールした後、再度 `conda create` を実行．

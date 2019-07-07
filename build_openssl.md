首先

1.安装最新版的ActivePerl

2.到https://www.openssl.org 下载最新OpenSSL源码

3.到http://www.nasm.us 下载NASM汇编工具

下载完成后依次安装 ActivePerl （注意勾选项，会自动加路径到系统环境变量Path中，否则要自己手动加） 和 Nasm （需要手动加到环境变量中）

如此完成后，将openssl-1.1.1-pre9.tar.gz解压缩，比如我解压缩了放在F:\Project\C\OpenSSL目录下。

然后通过window菜单找到适用于VS 2019的x64本机工具命令提示工具。

打开命令工具后，进入目录F:\Project\C\OpenSSL目录 (就是你刚解压缩的目录)

然后依次执行命令：

```
perl Configure VC-WIN64A -prefix=C:\OpenSSL
nmake
nmake install
```

将C:\Program Files\Openssl中的include和lib目录复制到FFmpeg中，将lib中的lib文件改为ssl.lib和crytpo.lib，然后进入下一步的编译步骤。

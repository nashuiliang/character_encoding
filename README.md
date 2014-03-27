字符编码转换
============

binary 转化为 简单ASCII
--------------------------
* `dns_source`  为测试文件

  ``` bash
	perl binary_to_ascii.pl dns_source
  ```

binary 转化为 ASCII
-----------
  `erlang` 生成ASCII控制字符(0X00 ~ 0X1F 32个)
	```erlang
	c(write_ascii).
	write_ext_ascii:start("ascii").
	```

  ``` bash
	perl binary_to_real_ascii.pl dns_source
  ```

binary 转化为 Latin-1
-----------
  `erlang` 生成扩展ASCII(0XA0~0XFF 96个)
	``` erlang
	c(write_ext_ascii).
	write_ext_ascii:start("ext_ascii").
	```
	执行
  ``` bash
	perl binary_to_latin-1.pl dns_source
  ```

binary 转化为 中文(部分)
-----------
* `test` 为测试文件

  ``` bash
	perl binary_to_utf8.pl test
  ```

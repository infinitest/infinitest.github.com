---
layout: doc
title: infinitest.args
---
## infinitest.args

Infinitest allows to configure JVM options (such as memory settings, system properties, java language assertions, etc...) when running tests.

This is done through the infinitest.args file.
This file is a simple text file that contains one VM argument per line to be included whenever Infinitest runs tests. 

By default, Infinitest sets a maximum heap size of 256mb. You can override that by setting e.g. ``-Xmx512m`` (for twice the heap space).

## Example

```
-Xmx512m
-Djavax.net.ssl.trustStore="C:\Users\user11\mycacerts.jks"
-Djavax.net.ssl.trustStorePassword=changeit
-Djavax.net.ssl.keyStore="C:\Users\user11\mykeys.jks"
-Djavax.net.ssl.keyStorePassword=mypass
```

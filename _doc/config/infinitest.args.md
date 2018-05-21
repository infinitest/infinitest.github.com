---
layout: doc
title: infinitest.args
---
## infinitest.args

Infinitest allows to configure JVM options (such as memory settings, system properties, java language assertions, etc...) when running tests.

This is done through the infinitest.args file.
This file is a simple text file that contains one VM argument per line to be included whenever Infinitest runs tests. 

By default, Infinitest sets a maximum heap size of 256mb. You can override that by setting e.g. ``-mx512m`` (for twice the heap space). 

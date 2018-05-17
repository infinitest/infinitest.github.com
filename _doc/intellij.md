---
title: Infinitest for IntelliJ Documentation
---

# Infinitest for IntelliJ Documentation

## Installation


## How it works

Infinitest inspects your classes to find tests.

Every time you change some code and IntelliJ recompiles it infinitest computes which tests need to be executed and rerun them. 


*Note*:
Infinitest detect changes on the .class files but by default, IntelliJ does not compile classes when saving code.
So Infinitest will only detect changes and run test when building project (Ctrl+F9). 

Alternatively you can configure IntelliJ to "Make project automatically" on save in `Settings->Compiler`. This way, you tests will be executed on save.

## Configuring Infinitest

### Filtering executed tests using infinitest.filters

By default Infinitest executes all Junit and TestNG tests.

You can configure which tests it should execute by adding an `infinitest.filters` file.

See [Filtering Syntax]({{ site.baseurl }}{% link _doc/config/infinitest.filters.md %}) for more info on how to filter tests.

### Configuring JVM options

JVM option can be configured by defining a infinitest.args file.

See [infinitest.args syntax]({{ site.baseurl }}{% link _doc/config/infinitest.args.md %}).


## External Resources

[Introductory article by Mkyoing](https://www.mkyong.com/intellij/intellij-infinitest-continuous-testing/)

### Infinitest isn't running my tests

You have to compile the file after you change it. By default, IntelliJ does not compile classes automatically like Eclipse. Also, check the `infinitest.filters` file to make sure your tests are not ignored.

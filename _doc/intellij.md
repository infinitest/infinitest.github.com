---
title: Infinitest for IntelliJ Documentation
---
# Infinitest for IntelliJ


This is the documentation for Infinitest for Intellij.

Looking for the Infinitest for Eclipse? [Go here]({{ site.baseurl }}{% link _doc/eclipse.md %}).

* TOC
{:toc}

## Installation

Install the Infinitest plugin from the plugin manager:
* Go to "File > Settings"
* Select Plugins node in the settings tree
* Click "Browse repositories..." button 
* In the "Browse Repositories" dialog Type "Infintiest" 
* Click "install"
* Restart IntelliJ

*Note:*
You can aleternatively download the jar from  (Jetbrains Plugin Repository)[https://plugins.jetbrains.com/plugin/3146-infinitest] and then install it from disk.

## Enabling Infinitest

To enable the Infinitest facet for your project you need to add the Infinitest facet to your project modules.

To do so:
* Go to "File > Project Structure"
* Add the the Infinitest Facet to your test modules by:
 * clicking a module
 * Click the green "+" button
 * Select "Infinitest"

## How it works

Infinitest inspects your classes to find tests.

Every time you change some code and IntelliJ recompiles it infinitest computes which tests need to be executed and rerun them. 

*Note*:
Infinitest detect changes on the .class files but by default, IntelliJ does not compile classes when saving code.
So Infinitest will only detect changes and run test when building project (Ctrl+F9). 
Alternatively you can configure IntelliJ to "Make project automatically" on save in `Settings->Compiler`. This way, you tests will be executed on save.

The test failures are displayed:
* As Markers in the test files
* In the Infinitest Tool Window for the each module.

## Configuring Infinitest

### Filtering executed tests using infinitest.filters

By default Infinitest executes all Junit and TestNG tests.

You can configure which tests it should execute by adding an `infinitest.filters` file in the .idea/modules directory.

See [Filtering Syntax]({{ site.baseurl }}{% link _doc/config/infinitest.filters.md %}) for more info on how to filter tests.

*Note*:
When changing infinitest.filters you need to do "Build>Rebuild Project" to force infinitest to reinitialize.

### Configuring JVM options

JVM option can be configured by defining a infinitest.args file.

See [infinitest.args syntax]({{ site.baseurl }}{% link _doc/config/infinitest.args.md %}).

## Common Problems

### Infinitest isn't running my tests

You have to compile the file after you change it. By default, IntelliJ does not compile classes automatically like Eclipse. Also, check the `infinitest.filters` file to make sure your tests are not ignored.

## External Resources

[Introductory article by Mkyoing](https://www.mkyong.com/intellij/intellij-infinitest-continuous-testing/)


---
layout: doc
title: Infinitest for IntelliJ Documentation
---


This is the documentation for Infinitest for Intellij. (Looking for the Infinitest for Eclipse? [Click here]({{ site.baseurl }}{% link _doc/eclipse.md %}).)

* TOC
{:toc}

# Get Started
## Installation

Install the Infinitest plugin from the plugin manager:
* Go to "File > Settings"
* Select Plugins node in the settings tree
* Click "Browse repositories..." button 
* In the "Browse Repositories" dialog Type "Infinitest" 
* Click "install"
* Restart IntelliJ

*Note:*
You can alternatively download the jar from [Jetbrains Plugin Repository](https://plugins.jetbrains.com/plugin/3146-infinitest) and then install it from disk.

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


{% include note-start.html%}
Infinitest detect changes on the .class files but by default, IntelliJ does not compile classes when saving code.
So Infinitest will only detect changes and run test when building project (Ctrl+F9). 
<br><br>
Alternatively you can configure IntelliJ to "Make project automatically" on save in "Settings->Compiler". This way, your tests will be executed on save.
{% include note-end.html%}

## Viewing test results

The test failures are displayed:
* As Markers in the test files
* In the Infinitest Tool Window for the each module.

Additionally the Tool Window allows to:
* Stop/start Infinitest.
* View the Infinitest logs.

# Configuring Infinitest

## Filtering executed tests using infinitest.filters

By default Infinitest executes all Junit and TestNG tests.

You can configure which tests it should execute by adding an "infinitest.filters" file in the .idea/modules directory.

See [Filtering Syntax]({{ site.baseurl }}{% link _doc/config/infinitest.filters.md %}) for more info on how to filter tests.

{% include note-start.html%}
When changing "infinitest.filters" you need to do "Build>Rebuild Project" to force infinitest to reinitialize.
{% include note-end.html%}

## Configuring JVM options

JVM option can be configured by defining a infinitest.args file.

See [infinitest.args syntax]({{ site.baseurl }}{% link _doc/config/infinitest.args.md %}).

# Common Problems

## Infinitest isn't running my tests

You have to compile the file after you change it. By default, IntelliJ does not compile classes automatically like Eclipse. 

Also, check the "infinitest.filters" file to make sure your tests are not ignored.

# External Resources

[Introductory article by Mkyoing](https://www.mkyong.com/intellij/intellij-infinitest-continuous-testing/)


---
category: doc
layout: documentation
title: Infinitest User Guide
---


## Changelog
For release announcements, subscribe to the [Infinitest News Feed](http://infinitest.github.com/rss.xml).

## Requirements

### Supported IDEs

Infinitest can be installed on Eclipse and IntelliJ.

Starting with Infinitest 5.2 Java 8 is required. 

### Supported test engines

Infinitest is able to execute test written using Junit (3, 4, 5) and TestNG.

### Supported programming language

Infinitest is primarily aimed at supporting continuous testing for Java.
However it is also working with other JVM based languages.

## Installation

### Installation on Eclipse 

You can install Infinitest from [Eclipse Marketplace](https://marketplace.eclipse.org/content/infinitest).

You can also install Infinitest using the update site: http://infinitest.github.io.

### Installation on IntelliJ

Install the [Infinitest plugin](https://plugins.jetbrains.com/plugin/3146-infinitest) from the plugin manager.

After installing the plugin from the Plugin Manager, enable the Infinitest facet for your project. 
Right click on the project, choose facet, add Infinitest.


## Filtering Tests

By default Infinitest will run all tests found.

If you have tests in your project that run too slowly or that can't be run by Infinitest, you can tell Infinitest not to run them.
 
To do so create a file named `infinitest.filters` in your projects.

*Note*: the syntax described below is for Infinitest 5.2+ (see [legacy syntax](legacy_infinitest_filters_syntax.html) for older versions).

### Filtering by test class name

You can tell Infinitest to include and exclude tests for which class name match a given regular expression pattern.

You can specify inclusion patterns by adding a new line in `infinitest.filters` with the form `include <includedPattern1>[, <includedPattern2> ...]`.
Similarly you can specify exclusion patterns by adding a new line in `infinitest.filters` with the form `exclude <excludedPattern1>[, <excludedPattern2>...]`.

Examples:

    # Include tests that end in ITest or TestCase
    include .*ITest, .*TestCase
    
    # Exclude Inner Classes
    exclude .*\$.*
    
    # Include tests in package com.mycompany.mypackage and sub-packages
    include com\.mycompany\.mypackage\..*
    
    # Include tests in package com.mycompany.mypackage and not in sub-packages
    include com\.mycompany\.mypackage\.[^.]*
    
Note that you can add several inclusion or exclusion patterns on different lines or on the same line separated by commas.

      
### Filtering by Junit 5 Tags

If you're using Junit 5 you can tell Infinitest to include or exclude [Tags](https://junit.org/junit5/docs/current/user-guide/#writing-tests-tagging-and-filtering).

You can specify included tags by adding a new line in `ìnfinitest.filters` with the form `includeGroups <tagName>[, <tagName2>...]`.
Similarly you can specify execluded tags by adding a new line in `ìnfinitest.filters` with the form `excludeGroups <tagName>[, <tagName2>...]`.

Examples:

    # Include tests with "Fast" and "Regression" tags
    includeGroups Fast, Regression
    
    # Exclude tests with "Slow" tag
    excludeGroups Slow


### Filtering by Junit 4 Categories

If you're using Junit 4 you can tell Infinitest to include or exclude [Categories](https://github.com/junit-team/junit4/wiki/categories).

You can specify included categories by adding a new line in `ìnfinitest.filters` with the form `includeGroups <CategoryClass1>[, <CategoryClass3>...]`.
Similarly you can specify excluded categories by adding a new line in `ìnfinitest.filters` with the form `excludeGroups <CategoryClass1>[, <CategoryClass2>...]`.

Examples:

    # Include tests in FastTests and RegressionTests categories
    includeGroups com.example.FastTests, com.example.RegressionTests
    
    # Exclude SlowTests category
    excludeGroups com.example.SlowTests


### Filtering by TestNG groups

If you're using TestNG you can tell Infinitest to include or exclude [TestNG groups](http://testng.org/doc/documentation-main.html#test-groups).

Examples:

    # Tests with a group-annotation in excluded-groups are not executed:
    excludeGroups manual, slow

This excludes all TestNG-tests that have either the annotation *groups = { "slow" }* or *groups = { "manual" }* from execution.

Example 2:

    # Tests with a group-annotation in groups are the only ones being executed (overridden by excluded-groups):
    includeGroups shouldbetested

This makes Infinitest only execute those TestNG-test that have the annotation `groups = { "shouldbetested" }`.

## Using TestNG listeners

If you're using TestNG you can use [TestNG listeners](http://testng.org/doc/documentation-main.html#testng-listeners) to add certain behaviours (e.g. configuring a special test-output or a special-needs library like jmockit). Just like TestNG groups you can add them to `infinitest.filters`:

    testngListeners com.myproject.MyTestNGListener1, com.myproject.MyTestNGListener2

This causes Infinitest to call the listeners when a TestNG test is executed.

You can check this file in source control to allow all developers to filter the same tests, or generate it as part of your build process.

## Setting JVM Options

If you need to set custom JVM options (such as memory settings, system properties, java language assertions, etc...) when running tests, you can configure them by creating a simple text file in the working directory of your project named `infinitest.args` that contains one VM argument per line to be included whenever Infinitest runs tests. By default, Infinitest sets a maximum heap size of 256mb. You can override that by setting e.g. ``-mx512m`` (for twice the heap space). Just as with the filter file, this can be checked into source control, or generated as part of an automated build.

## Pro Tips

You can run all the tests in a project (and generally 'reset' things) in Infinitest-Eclipse by cleaning the project.  
You can view the stack trace for a failure from the quick fix menu.

By default, IntelliJ does not compile classes automatically like Eclipse. You can obtain the same behaviour by checking the box "Make project automatically" in `Settings->Compiler`. This way, you tests will be executed automagically without having anything to do.

## Common Problems

### Infinitest isn't running my tests

If you're running Eclipse, ensure that:

You've resolved any compiler or other workspace errors.
The "Continuously Test" option in the Infinitest preferences (under Window->Preferences) is checked.
"Build Automatically" under the "Project" menu is checked.
The test is not being filtered by an entry in the `infinitest.filters` file in the root directory of the project.
If you're using a custom builder (like AspectJ) make sure you have the appropriate plugins installed.

If you're using IntelliJ:

You have to compile the file after you change it. By default, IntelliJ does not compile classes automatically like Eclipse (see "Pro Tips"). Also, check the `infinitest.filters` file to make sure your tests are not ignored.

### I can't access the update site!

If you are behind a firewall, you may have limited access to the Internet. This can cause problems accessing the update site. If you use a web proxy to connect to the Internet, make sure that you have correctly entered your proxy settings into Eclipse under `Preferences->General->Network Connections`.

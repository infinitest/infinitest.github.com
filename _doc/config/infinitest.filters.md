---
layout: doc
title: infinitest.filters
---

The *infinitest.filters* file allows to configure the tests to execute as well as the TestNG listeners.

*Note*: the syntax described below is for Infinitest 5.2+ (see [legacy syntax]({{ site.baseurl }}{% link _doc/config/infinitest.filters-legacy.md %})) for older versions).

* TOC
{:toc}


## Filtering Tests

By default Infinitest will run all tests found.

If you have tests in your project that run too slowly or that can't be run by Infinitest, you can tell Infinitest not to run them.
 
To do so create a file named *infinitest.filters* in your projects.

## Filter file location

The filter file must be at the root of the project.

For the IntelliJ plugin it is possible to override the project-level filters by adding a filter file at the root of a module.
In that case the project-level filter file is ignored for the corresponding module.


### Filtering by test class name

You can tell Infinitest to include and exclude tests for which class name match a given regular expression pattern.

You can specify inclusion patterns by adding a new line in *infinitest.filters* with the form `include <includedPattern1>[, <includedPattern2> ...]`.
Similarly you can specify exclusion patterns by adding a new line in *infinitest.filters* with the form `exclude <excludedPattern1>[, <excludedPattern2>...]`.

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

You can specify included tags by adding a new line in `infinitest.filters` with the form `includeGroups <tagName>[, <tagName2>...]`.
Similarly you can specify excluded tags by adding a new line in `infinitest.filters` with the form `excludeGroups <tagName>[, <tagName2>...]`.

Examples:

    # Include tests with "Fast" and "Regression" tags
    includeGroups Fast, Regression
    
    # Exclude tests with "Slow" tag
    excludeGroups Slow


### Filtering by Junit 4 Categories

If you're using Junit 4 you can tell Infinitest to include or exclude [Categories](https://github.com/junit-team/junit4/wiki/categories).

You can specify included categories by adding a new line in `infinitest.filters` with the form `includeGroups <CategoryClass1>[, <CategoryClass3>...]`.
Similarly you can specify excluded categories by adding a new line in `infinitest.filters` with the form `excludeGroups <CategoryClass1>[, <CategoryClass2>...]`.

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

If you're using TestNG you can use [TestNG listeners](http://testng.org/doc/documentation-main.html#testng-listeners) to add certain behaviours (e.g. configuring a special test-output or a special-needs library like jmockit). Just like TestNG groups you can add them to *infinitest.filters*:

    testngListeners com.myproject.MyTestNGListener1, com.myproject.MyTestNGListener2

This causes Infinitest to call the listeners when a TestNG test is executed.

You can check this file in source control to allow all developers to filter the same tests, or generate it as part of your build process.

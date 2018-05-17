---
category: doc
layout: documentation
title: Legacy infinitest.filters Syntax
---


## Legacy infinitest.filters syntax 

*Note*: the syntax described below is for Infinitest versions before 5.2 (see [new syntax]({{ site.baseurl }}{% link _doc/config/infinitest.filters.md %}) for current syntax).

### Filtering with Regular Expressions

The `infinitest.filters` contains regular expressions (one per line) that match the test classes you want to filter. Put this file in the root of your project (a.k.a. the working directory), and Infinitest will filter those tests out. Here are some examples:

    Tests that end in ITest:
    .*ITest
    
    Inner Classes:
    .*\$.*
    
    Tests in a certain package:
    com\.mycompany\.mypackage\..*
    
    All tests in this project:
    .*

### Filtering with TestNG groups

If you're using TestNG you can also add filter options for [TestNG groups](http://testng.org/doc/documentation-main.html#test-groups) to `infinitest.filters`. Please be careful to mark them with ## like in the following examples:

    ## TestNG Configuration
    # Tests with a group-annotation in excluded-groups are not executed:
    ## excluded-groups=manual,slow

This excludes all TestNG-tests that have either the annotation *groups = { "slow" }* or *groups = { "manual" }* from execution.

    ## TestNG Configuration
    # Tests with a group-annotation in groups are the only ones being executed (overridden by excluded-groups):
    ## groups=shouldbetested

This makes Infinitest only execute those TestNG-test that have the annotation `groups = { "shouldbetested" }`.

### Using TestNG listeners

If you're using TestNG you can use [TestNG listeners](http://testng.org/doc/documentation-main.html#testng-listeners) to add certain behaviours (e.g. configuring a special test-output or a special-needs library like jmockit). Just like TestNG groups you can add them to `infinitest.filters`:

    ## listeners=com.myproject.MyTestNGListener1, com.myproject.MyTestNGListener2

This causes Infinitest to call the listeners when a TestNG test is executed.

You can check this file in source control to allow all developers to filter the same tests, or generate it as part of your build process.


---
category: doc
layout: documentation
title: Infinitest User Guide
---
For release announcements, subscribe to the [Infinitest News Feed](http://infinitest.github.com/rss.xml).

## Install on Eclipse

You have to install the plugin in Eclipse using this update site : http://infinitest.github.com

## Install on IntelliJ

After installing the plugin from the Plugin Manager, enable the Infinitest facet for your project. Right click on the project, choose facet, add Infinitest.

## Filtering Tests

If you have tests in your project that run too slowly to run all the time, you can tell Infinitest not to run them. Create a file named `infinitest.filters` in your projects.

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

## Setting JVM Options

If you need to set custom JVM options (such as memory settings, system properties, java language assertions, etc...) when running tests, you can configure them by creating a simple text file in the working directory of your project named `infinitest.args` that contains one VM argument per line to be included whenever Infinitest runs tests. By default, Infinitest sets a maximum heap size of 256mb. You can override that by setting e.g. ``-mx512m`` (for twice the heap space). Just as with the filter file, this can be checked into source control, or generated as part of an automated build.

## Pro Tips

You can run all the tests in a project (and generally 'reset' things) in Infinitest-Eclipse by cleaning the project.  
You can view the stack trace for a failure from the quick fix menu

By default, IntelliJ does not compile classes automatically like Eclipse. You can obtain the same behaviour by checking the box "Make project automatically" in "Settings > Compiler". This way, you tests will be executed automagically without having anything to do.

## Common Problems

### Infinitest isn't running my tests

If you're running Eclipse, ensure that:

You've resolved any compiler or other workspace errors
The "Continuously Test" option in the Infinitest preferences (under Window->Preferences) is checked
"Build Automatically" under the "Project" menu is checked
The test is not being filtered by an entry in the `infinitest.filters` file in the root directory of the project
If you're using a custom builder (like AspectJ) make sure you have the appropriate plugins installed

If you're using IntelliJ:

You have to compile the file after you change it. By default, IntelliJ does not compile classes automatically like Eclipse (see "Pro Tips"). Also, check the `infinitest.filters` file to make sure your tests are not ignored.

### I can't access the update site!

If you are behind a firewall, you may have limited access to the Internet. This can cause problems accessing the update site. If you use a web proxy to connect to the Internet, make sure that you have correctly entered your proxy settings into Eclipse under `Preferences->General->Network Connections`.

---
layout: doc
title: Infinitest for Eclipse Documentation
---

This is the documentation for Infinitest for Eclipse. (Looking for the Infinitest for IntelliJ? [Click here]({{ site.baseurl }}{% link _doc/intellij.md %}).)

* TOC
{:toc}

# Get Started

## Installation

The easiest option is to install Infinitest from [Eclipse Marketplace](https://marketplace.eclipse.org/content/infinitest).

Alternatively you can use the update site: http://infinitest.github.io.

## How it works

Infinitest inspects your code to find tests.

Every time you change some code and eclipse recompiles it infinitest computes which tests need to be executed and rerun them. 

You can run all the tests in a project (and generally 'reset' things) in Infinitest-Eclipse by cleaning the project.  

## Viewing test results

Infinitest reports the test failures as:
* Errors in the eclipse "Problems" view
* Error annotation in the test source editor. 
* You can view the stack trace for a failure from the quick fix menu.

Additionally the there is an Infinitest Console displaying Infinitest logs.

# Configuring Infinitest

## Workspace level Preferences

You can enable and disable infinitest from eclipse workspace preferences.
To do so:
* Go to Window > Preferences (or Eclipse > Preferences on Mac)
* Select Infinitest node in the preference tree
* Check/uncheck the "Continuously Check" checkbox.

## Filtering executed tests using infinitest.filters

By default Infinitest executes all Junit and TestNG tests it finds in your projects.
You can configure which test it should configure by adding an "infinitest.filters" file at the root of your eclipse project. 

See [Filtering Syntax]({{ site.baseurl }}{% link _doc/config/infinitest.filters.md %}) for more info on how to filter tests.

{% include note-start.html%}
After changing the content of infinitest.filters you need to force a rebuild of the project using "Project > Clean" Eclipse action.
{% include note-end.html%}

## Configuring JVM options

JVM option can be configured by defining a infinitest.args file at the root of your eclipse project.

See [infinitest.args syntax]({{ site.baseurl }}{% link _doc/config/infinitest.args.md %}).

# Common Problems

## I can't access the update site!

If you are behind a firewall, you may have limited access to the Internet. This can cause problems accessing the update site. If you use a web proxy to connect to the Internet, make sure that you have correctly entered your proxy settings into Eclipse under "Preferences->General->Network Connections".

## Infinitest isn't running my tests

Ensure that:
* You've resolved any compiler or other workspace errors.
* The "Continuously Test" option in the Infinitest preferences is checked (See [Workspace Level Preferences](#workspace-levelpreferences))
* "Build Automatically" under the "Project" menu is checked.
* The test is not being filtered by an entry in the "infinitest.filters" file in the root directory of the project.
* If you're using a custom builder (like AspectJ) make sure you have the appropriate plugins installed.


## External Resources

[Introductory video by Brandan Jones](https://www.youtube.com/watch?v=bltBrpjdKIc)
{% include note-start.html%}
This video uses the legacy syntax for infinitest.filters
{% include note-end.html%}


# core_ext

In many of my projects I find myself adding a small to medium sized handful of methods to the Ruby core classes, and testing them in the context of that project.

So I thought I'd consolidate those methods so that

* I can just drop them into projects
* You can just drop them into projects, if you are so inclined
* They can be in an environment where they can be tested without polluting a project-specific testing space

## NPM Scripts Task Runner extension

Adds support for package.json's NPM scripts in Visual Studio 2015's
Task Runner Explorer.

[![Build status](https://ci.appveyor.com/api/projects/status/ktn1qy982qsprwb5?svg=true)](https://ci.appveyor.com/project/madskristensen/bundlerminifier)

Download the extension at the
[VS Gallery](https://visualstudiogallery.msdn.microsoft.com/9ec27da7-e24b-4d56-8064-fd7e88ac1c40)
or get the
[nightly build](http://vsixgallery.com/extension/d7f89ba3-815c-4feb-89b9-68d1654e2138/)

### NPM scripts

Inside package.json it is possible to add custom scripts inside
the "scripts" element. When doing that, the Task Runner Explorer
will show those scripts.

![Task list](art/task-list.png)

Each script can be executed by double-clicking the task.

### Bindings

Script bindings make it possible to associate individual scripts
with Visual Studio events such as "After build" etc.

![Visual Studio bindings](art/bindings.png)
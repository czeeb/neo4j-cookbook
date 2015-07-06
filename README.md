neo4j Cookbook
==============
[![Build Status](https://travis-ci.org/czeeb/neo4j-cookbook.svg?branch=master)](https://travis-ci.org/czeeb/neo4j-cookbook)
[![Dependency Status](https://gemnasium.com/czeeb/neo4j-cookbook.svg)](https://gemnasium.com/czeeb/neo4j-cookbook)

This cookbook installs neo4j.

Platforms
---------
The following platforms and versions are tested and supported using [test-kitchen](http://kitchen.ci/)

* Debian 7.8, 8.1
* Ubuntu 12.04, 14.04

Usage
-----
#### neo4j::default

e.g.
Just include `neo4j` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[neo4j]"
  ]
}
```

Contributing
------------
e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Chris Zeeb <chris.zeeb@gmail.com>

```text
Copyright:: 2015 Chris Zeeb <chris.zeeb@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Lua Bloom Filter Library
------------------------

## Overview
A Bloom filter is a space-efficient probabilistic data structure that is used to test whether an element is a member of a set.

## Installation

### Prerequisites
* C compiler (GCC 4.7+, Visual Studio 2013, MinGW (Lua 5.1))
* Lua 5.1, Lua 5.2, or LuaJIT
* [CMake (2.8.7+)](http://cmake.org/cmake/resources/software.html)

### CMake Build

#### lua_bloom_filter  - UNIX Build Instructions

    git clone https://github.com/mozilla-services/lua_bloom_filter.git
    cd lua_bloom_filter 
    mkdir release
    cd release
    cmake -DCMAKE_BUILD_TYPE=release ..
    make install

    ctest

#### lua_bloom_filter  - Windows Build Instructions

    # in a VS2013 command prompt window

    git clone https://github.com/mozilla-services/lua_bloom_filter.git
    cd lua_hyperloglog 
    mkdir release
    cd release
    cmake -DCMAKE_BUILD_TYPE=release -G "NMake Makefiles" ..
    nmake install

    # To run the tests you must install
    cmake -DCMAKE_INSTALL_PREFIX="" ..
    nmake install DESTDIR=test
    cd ..\src\test
    ..\..\release\test\lib\test_lua_bloom_filter.exe

## Module

### Example Usage
```lua
require "bloom_filter"

local bf = bloom_filter.new()
local found = bf:query("test")
-- found == false
bf:add("test")
found = bf:query("test")
-- found == true
```

### API Functions

#### new
```lua
require "bloom_filter"
local bf = bloom_filter.new()
```

Import the Lua _bloom_filter_ via the Lua 'require' function. The module is
globally registered and returned by the require function.

*Arguments*
- items (unsigned) The maximum number of items to be inserted into the filter (must be > 1)
- probability (double) The probability of false positives (must be between 0 and 1)

*Return*
- bloom_filter userdata object.

### API Methods

#### add
```lua
local added = bloom:add(key)
```

Adds an item to the bloom filter.

*Arguments*
- key (string/number) The key to add in the bloom filter.

*Return*
- True if the key was added, false if it already existed.

#### query
```lua
local found = bf:query(key)
```

Checks for the existence of an item in the bloom filter.

*Arguments*
- key (string/number) The key to lookup in the bloom filter.

*Return*
- True if the key exists, false if it doesn't.

#### clear
```lua
bf:clear()
```

Resets the bloom filter to an empty set.

*Arguments*
- none

*Return*
- none

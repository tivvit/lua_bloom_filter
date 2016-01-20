Lua Bloom Filter Library
------------------------

## Overview
A Bloom filter is a space-efficient probabilistic data structure that is used to test whether an element is a member of a set.

## Installation

### Prerequisites
* C compiler (GCC 4.7+, Visual Studio 2013, MinGW (Lua 5.1))
* Lua 5.1 or LuaJIT
* [CMake (2.8.7+)](http://cmake.org/cmake/resources/software.html)

### CMake Build Instructions

    git clone https://github.com/mozilla-services/lua_bloom_filter.git
    cd lua_bloom_filter 
    mkdir release
    cd release
    
    # UNIX
    cmake -DCMAKE_BUILD_TYPE=release ..
    make

    # Windows Visual Studio 2013
    cmake -DCMAKE_BUILD_TYPE=release -G "NMake Makefiles" ..
    nmake

    ctest
    cpack

## Module

### Example Usage
```lua
require "bloom_filter"

local bf = bloom_filter.new(1000, 0.01)
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
local bf = bloom_filter.new(1000, 0.01)
```

Import the Lua _bloom_filter_ via the Lua 'require' function. The module is
globally registered and returned by the require function.

*Arguments*
- items (unsigned) The maximum number of items to be inserted into the filter (must be > 1)
- probability (double) The probability of false positives (must be between 0 and 1)

*Return*
- bloom_filter userdata object.

#### version
```lua
require "bloom_filter"
local v = bloom_filter.version()
-- v == "0.1.0"
```

Returns a string with the running version of bloom_filter.

*Arguments*
- none

*Return*
- Semantic version string

### API Methods

#### add
```lua
local added = bf:add(key)
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

Checks for the existence of the key in the bloom filter.

*Arguments*
- key (string/number) The key to lookup in the bloom filter.

*Return*
- True if the key exists, false if it doesn't.

#### count
```lua
local added = bf:count()
```

Returns the number of items in the bloom.

*Arguments*
- none

*Return*
- Returns the number of distinct items added to the set.

#### clear
```lua
bf:clear()
```

Resets the bloom filter to an empty set.

*Arguments*
- none

*Return*
- none

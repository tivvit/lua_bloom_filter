-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.

require "bloom_filter"
assert(bloom_filter.version() == "0.1.0", bloom_filter.version())

local errors = {
    function() local bf = bloom_filter.new(2) end, -- new() incorrect # args
    function() local bf = bloom_filter.new(nil, 0.01) end, -- new() non numeric item
    function() local bf = bloom_filter.new(0, 0.01) end, -- invalid items
    function() local bf = bloom_filter.new(2, nil) end, -- nil probability
    function() local bf = bloom_filter.new(2, 0) end, -- invalid probability
    function() local bf = bloom_filter.new(2, 1) end, -- invalid probability
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:add() --incorrect # args
    end,
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:add({}) --incorrect argument type
    end,
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:query() --incorrect # args
    end,
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:query({}) --incorrect argument type
    end,
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:clear(1) --incorrect # args
    end,
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:fromstring({}) --incorrect argument type
    end,
    function()
        local bf = bloom_filter.new(20, 0.01)
        bf:fromstring("                       ") --incorrect argument length
    end
}

for i, v in ipairs(errors) do
    local ok = pcall(v)
    if ok then error(string.format("error test %d failed\n", i)) end
end

bf = bloom_filter.new(20, 0.01)
assert(not bf:query("one"), "bloom filter should be empty")
assert(bf:add("one"), "insert failed")
assert(bf:add("two"), "insert failed")
assert(bf:query("one"), "bloom filter should contain 'one'")
assert(bf:query("two"), "bloom filter should contain 'two'")
bf:clear()
assert(not bf:query("one"), "bloom filter should be empty")

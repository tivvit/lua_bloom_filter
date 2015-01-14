/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* vim: set ts=2 et sw=2 tw=80: */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/** @brief Lua bloom_filter module @file */

#ifndef lua_bloom_filter_h_
#define lua_bloom_filter_h_

#include <lua.h>

extern const char* mozsvc_bloom_filter;
extern const char* mozsvc_bloom_filter_table;

/**
 * Bloom library loader
 *
 * @param lua Lua state.
 *
 * @return 1 on success
 *
 */
int luaopen_bloom_filter(lua_State* lua);

#endif

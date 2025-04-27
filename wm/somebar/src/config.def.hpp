// somebar - dwl bar
// See LICENSE file for copyright and license details.

#pragma once
#include "common.hpp"

constexpr bool topbar = true;

constexpr int paddingX = 10;
constexpr int paddingY = 7;

// See https://docs.gtk.org/Pango/type_func.FontDescription.from_string.html
constexpr const char *font = "monospace 14";

constexpr ColorScheme colorInactive = {Color(0xbb, 0xbb, 0xbb),
                                       Color(0x17, 0x1c, 0x1f)};

constexpr ColorScheme colorActive = {Color(0x17, 0x1c, 0x1f),
                                     Color(0x83, 0x9e, 0x9a)};

constexpr const char *termcmd[] = {"foot", nullptr};

static std::vector<std::string> tagNames = {
    "1", "2", "3", "4", "5",
};

constexpr Button buttons[] = {
    {ClkStatusText, BTN_RIGHT, spawn, {.v = termcmd}},
};

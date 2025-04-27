// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", "sh show_volume.sh", 0, 11},
    {"", "sh cpu_usage.sh", 2, 0},
    {"", "sh cpu_temp.sh", 2, 0},
    {"", "sh mem.sh", 2, 0},

    {"", "sh backlight.sh", 0, 10},
    {"", "sh time.sh", 1, 10},
    {"", "sh date.sh", 43200, 10},
    // {"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g", 30,
    // 0},

    // {"", "date '+%b %d (%a) %I:%M%p'", 5, 0}, Updates whenever "pkill
    // -SIGRTMIN+10 someblocks" is ran */
    /* {"", "date '+%b %d (%a) %I:%M%p'",
       0,		10}, */
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 80;

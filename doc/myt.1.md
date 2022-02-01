# myt(1) - a CLI tool for searching and watching videos on youtube with no spyware and MPV and yt-dlp

Myt, January 2022

```
myt [QUERY]
```



# Config File


The configuration file is located in _~/.config/myt.conf_ and it's generated
automatically on first startup of _myt(1)_

The file is written in dos INI (see _myt(1)_ "SEE ALSO" section)

The current config keys are:

.TS
tab (@);
l lx.
history@T{
    GNU _readline(1)_ history contol
T}
resources@T{
    URL and resource fetching control
T}
messages@T{
    Logging messages contol
T}
config@T{
    Configuration file locations
T}
.TE

Config headers:


**HISTORY**  

_history_file_ -- This value controls where the history file goes, by default it's _~/.cache/.myt_history_

_history_length_ -- This value controls how long the history file is, by default it's _1000_


**RESOURCES**  

_youtube_url_ -- This value controls the youtube URL, it must have a _/watch_ route which accepts _v_ as a GET parameter which is the _video ID_

_search_url_ -- This value controls the search URL, it has to return a page which has URLs which have the video URL in the page like or return a list of something like _/watch?v=pRKqlw0DaDI_, this URL also has to accept a _q_ GET paramter which is the search query


**MESSAGES**  

_print_debug_ -- This value controls if it should print debug messages (_yes_) or not (_no_)


**CONFIG**  

_readline_config_ -- This value controls where the optional GNU readline config lives, by default it's _~/.inputrc_



# See Also


DOS INI format: _https://en.wikipedia.org/wiki/INI_file_

Yt-dlp: _https://github.com/yt-dlp/yt-dlp_

MPV: _https://mpv.io/_

MPV man page: _mpv(1)_

GNU readline: _https://tiswww.case.edu/php/chet/readline/rltop.html_



# Author


Written by Ari Archer &lt;**[ari@mail.ari-web](mailto:ari@mail.ari-web).xyz\fB&gt; (\fIhttps://ari-web.xyz/**)



# Reporting Bugs


Report any bugs or feature requests to https://ari-web.xyz/gh/myt issues


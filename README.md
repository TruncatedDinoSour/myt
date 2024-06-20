# This repository has been migrated to the self-hosted ari-web Forgejo instance: <https://git.ari.lt/ari/myt>
# Myt

> A CLI tool for searching and watching videos on youtube with no spyware and MPV and yt-dlp

# Requirements

-   Python 3.8 and higher -- https://python.org/
-   A POSIX complient OS -- https://en.wikipedia.org/wiki/POSIX
-   Python logging -- https://pypi.org/project/logging/
-   Python readline -- https://pypi.org/project/readline/
-   GNU readline -- https://tiswww.case.edu/php/chet/readline/rltop.html
-   Python configparser -- https://pypi.org/project/configparser/
-   Python typing -- https://pypi.org/project/typing/
-   Python requests -- https://pypi.org/project/requests/
-   Python colorama -- https://pypi.org/project/colorama/
-   Python python-mpv -- https://pypi.org/project/python-mpv/
-   LibMPV -- https://github.com/mpv-player/mpv/tree/master/libmpv
-   MPV -- https://mpv.io/
-   Python plumbum -- https://pypi.org/project/plumbum/
-   Python pyfzf -- https://pypi.org/project/pyfzf/
-   FZF -- https://github.com/junegunn/fzf
-   yt-dlp -- https://github.com/yt-dlp/yt-dlp
-   man-db -- https://man-db.nongnu.org/

## Extra dependencies for development

-   Python mypy -- https://pypi.org/project/mypy/
-   Python isort -- https://pypi.org/project/isort/
-   Python flake8 -- https://pypi.org/project/flake8/
-   Python pycodestyle -- https://pypi.org/project/pycodestyle/
-   Python black -- https://pypi.org/project/black/
-   Python pyflakes -- https://pypi.org/project/pyflakes/
-   Python pylint -- https://pypi.org/project/pylint/
-   Python pydoc -- https://docs.python.org/3/library/pydoc.html
-   man-to-md -- https://github.com/mle86/man-to-md or https://ari-web.xyz/gentooatom/app-misc/man-to-md

To install them:

```bash
# Install only dev dependencies
python3 -m pip install --user --upgrade -r requirements.dev.txt
```

Or

```bash
# Install all dependencies
python3 -m pip install --user --upgrade -r requirements.txt -r requirements.dev.txt
```

After that install the extra non-python dependencies like man-to-md

Optional:

-   Ncurses -- https://invisible-island.net/ncurses/

# Installation

## Manual

```bash
python3 -m pip install --user --upgrade -r requirements.txt
sudo install -Dm0644 doc/myt.1 /usr/share/man/man1/myt.1
sudo mandb -qf /usr/share/man/man1/myt.1
sudo install -Dm755 src/myt /usr/local/bin
```

Also manually install non-python dependencies like LibMPV, FZF, etc.
listed in dependencies section above

## Packages

-   Linux
    -   Gentoo linux: [net-misc/myt::dinolay](https://ari-web.xyz/gentooatom/net-misc/myt)

# Customisation

Config file can be found in `~/.config/myt.conf`, it is automatically
generated first launch, more on that in the `myt(1)` manual page:

```bash
man myt
```

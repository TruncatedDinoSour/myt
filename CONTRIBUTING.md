# Contribution rules

-   Do not add any malicious code
-   Make sure your code passes **at least** all tests provided in `scripts/test.sh`
-   Make sure to run `./scripts/test.sh` before contributing
-   If you add anything new please document it in `doc/`, the [man page](/doc/myt.1) and/or the README.md
-   Make sure to update or add if necessary development dependencies in `requirements.dev.txt` and stuff that is 100% required in `requirements.txt`
-   If you need to add more tests to the `test.sh` script, but make sure to follow the same pattern of

```bash
log 'Doing something here'
do tests here
```

-   Make sure to commit using `scripts/git.sh` or at least rebuild the documentation using `scripts/doc.sh`
-   Make sure your new fix or feature works

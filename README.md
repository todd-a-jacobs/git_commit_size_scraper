# Git Commit Size Scraper

## Copyright and Licensing

### Copyright Notice

The copyright for the software, documentation, and associated files are
held by the author.

    Copyright 2012, 2013 Todd A. Jacobs
    All rights reserved.

The AUTHORS file is also included in the source tree.

### Software License

![GPLv3 Logo](http://www.gnu.org/graphics/gplv3-88x31.png)

The software is licensed under the
[GPLv3](http://www.gnu.org/copyleft/gpl.html). The LICENSE file is
included in the source tree.

### README License

![Creative Commons BY-NC-SA
Logo](http://i.creativecommons.org/l/by-nc-sa/3.0/us/88x31.png)

This README is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 3.0 United States
License](http://creativecommons.org/licenses/by-nc-sa/3.0/us/).

## Purpose

Git doesn't provide an easy way to determine the actual size of a given
commit. However, it is possible to walk Git history to estimate the
commit size in bytes by summing the objects associated with the commit.

## Caveats

- Currently measures blobs only; other object types are considered
  "overhead."
- Overhead from tree objects and commit objects are not currently
  included in the per-commit totals.
- Reports actual object size in bytes; does not take space savings from
  deltification or the packfile format into account.

## Installation and Setup

    gem install git_commit_size_scraper

## Usage

    # Accepts most arguments understood by git-rev-list(1).
    git_commit_size_scraper [args]

## Examples

No screenshots here, just samples of what you can expect to see on
standard output when you run the program.

### Command Line

    $> git_commit_size_scraper --max-count=10
    Walking 10 commits ...
    {"f60d13b456162bb3b2364336e517f3f16c900693"=>28942,
     "c1194d24f71f9f8ff9aa1fd83337a70d7c233481"=>28813,
     "0142283e2b014f5206bba70a7d6e695096b4da1c"=>28789,
     "891773ec2a448992e19cb1d5b3d894abee88ce23"=>28563,
     "9e5c5dcd87b542444b17388ea86cb34bcdca29ba"=>28520,
     "b2f0faf4fca0ccbf26388b87cd9aa49e6e6149a4"=>28344,
     "0880b036e42c2e8bbf4ddbf8c540390c12cc83cb"=>28211,
     "f2160f0a5f48424eb1b5d7a8292f814b293191ec"=>28157,
     "01256264e64949b2ba1aa61a513d633c9bee7157"=>27757,
     "5d52891ab5ac19efaf1f8f1a0f596e954d0e9dd8"=>26647}

    Average: 28,432.0 bytes
    Median : 28,274.3 bytes
    Std Dev: 693.07 bytes
    Total  : 282,743 bytes

### REPL

    require 'git_commit_size_scraper/scraper'
    include GitCommitSizeScraper

    git = Scraper.new '-n10'
    git.walk
    p "Total bytes committed: %d" % git.list.values.compact.reduce(:+)
    # => "Total bytes committed: 282743"

----

[Project Home Page](https://github.com/CodeGnome/git_commit_size_scraper)

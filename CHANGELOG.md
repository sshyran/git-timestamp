# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

# 0.9.1+ - [Unreleased]
## Added

## Fixed
### Client
- Fetch GnuPG key again if missing from keyring. This fixes unexpected
  behavior when running as sudo vs. natively at root.
- Work around a bug in older GnuPG installs (create `pubring.kbx` if it does
  not exist yet before using `scan_keys()`).

## Changed

# 0.9.1 - 2019-04-19
## Added
### Client
- `--server` can be set in git config
- Prevent actual duplicate entries created by `git timestamp --branch`
- Documented that `git timestamp --help` does not work and to use `-h`, as
  `--help` is swallowed by `git` and not forwarded to `git-timestamp`.
- Client system tests (require Internet connectivity)

### Server
- Ability to run multiple GnuPG (including gpg-agents) in parallel
- Handle missing `--push-repository` (again)

## Fixed
- Made tests compatible with older GnuPG versions

## Changed
### Client
- Made some error messages more consistent
- `--tag` overrides `--branch`. This allows to store a default branch in
  `git config`, yet timestamp a tag when necessary.

# 0.9.0 - 2019-04-04
Initial public release
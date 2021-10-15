# Readme

## Project structure

The source files are located in `src/`, examples in `examples/` and tests in `tests/`.
Files in `examples/`, `src/` and `tests/` rely on files in `src/` only.  No other directional dependency is permitted (and no cycles!).

```
.
├── examples
│   ├── logging
│   └── string
│       ├── case
│       ├── pad
│       ├── repeat
│       └── trim
├── src
│   ├── logging
│   ├── runner
│   ├── string
│   └── testing
└── tests
    ├── logging
    └── string
        ├── case
        ├── pad
        ├── repeat
        └── trim
```


## Installation

Set the env variable BashLib to the src directory of this project

```
cd project/src
export BashLib="$PWD"
```


## Usage

If you wish to use the string::ucase function which is defined in string/case, do this:

```
source "${BashLib}/string"

string::ucase 'Some text'
```

## Library contents

### Functions

- logging
   - echo\_info
   - echo\_warn
   - echo\_err
- string
  - string::lcase
  - string::ucase
  - string::pad\_left
  - string::pad\_right
  - string::pad\_inner
  - string::pad\_outer
  - string::repeat
  - string::ltrim
  - string::rtrim
  - string::trim


## Contributions

- Feature submittions must be supplied to a new branch, with comprehensive tests, all in a single commit per feature.  If this condition is not met, the request will immediately be rejected.
- Bug reports must be accompanied by the necessary tests to recreate the issue.  This will help identify the cause of the issue, and prevent regressions in the future.


##  Disclaimers

This library is:

- not guaranteed to work
- not guaranteed to be free of bugs
- made in our free time
- shared with you with no expectation of recompence


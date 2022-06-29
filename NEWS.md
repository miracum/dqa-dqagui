# DQAgui NEWS

## Unreleased (2022-06-29)

#### New Features

* added demo usage instructions
#### Fixes

* only showing waiter for report if there was no previous error
* setting envvars before connecting to database [#2](https://gitlab.miracum.org/miracum/dqa/dqagui/issues/2)
* setting envvars before connecting to database
* fixes [#43](https://gitlab.miracum.org/miracum/dqa/dqagui/issues/43) and [#48](https://gitlab.miracum.org/miracum/dqa/dqagui/issues/48)
#### Refactorings

* removed demo-usage instruction panel and added link to help/instructions in the menu
* switched from "data system" to "database" in wordings
#### Docs

* added documentation for demo_usage argument in launch_app; preparing next cran-release
#### Others

* updated gha (wip 3)
* updated gha (wip 2)
* updated gha
* updated news.md and description
* removed unnecessary pring message
* updated news.md; preparing new cran release
* updated lintr
* added sitename presetting in demo mode
* added waiter to wait for report rendering finished and set preset for demo-mode in csv list
* removed shinyapps deployment information
* updated docker files
* uncommented global stuff from shinyapps.io upload
* updated docker scripts
* updated R version to R 4.2.0
* updated image to R 4.2.0
* updated new dev version
* modularizing unittests due to failing on gha (wip 13)
* modularizing unittests due to failing on gha (wip 12)
* modularizing unittests due to failing on gha (wip 11)
* modularizing unittests due to failing on gha (wip 10)
* modularizing unittests due to failing on gha (wip 9)
* modularizing unittests due to failing on gha (wip 8)
* modularizing unittests due to failing on gha (wip 7)
* modularizing unittests due to failing on gha (wip 6)
* modularizing unittests due to failing on gha (wip 5)
* modularizing unittests due to failing on gha (wip 4)
* modularizing unittests due to failing on gha (wip 3)
* modularizing unittests due to failing on gha (wip 2)
* modularizing unittests due to failing on gha (wip)
* modularizing unittests due to failing on gha
* fixed linting errors and shiny-app unittests

Full set of changes: [`v0.2.0...b478a92`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.2.0...b478a92)

## v0.2.0 (2022-05-20)

#### New Features

* added logo
* showing 'no data available' in orange color for etl and conformance checks
* added new time-constraint preset - last calendar year
* added docker deployment
* added more time-frame presets
* adding config info to dashboard
#### Fixes

* fixed error when displaying values that violated conformance checks
* fixed error that occured when no data was available for datetime variables for checking
* displayname usage was broken
* removed link to localhost due to failing r cmd check
* added dot_helper due to failing r cmd check
* displaynames broke in some cases
* wrong formatting of data restrictions in dq check
* fixes missing system display if displayname was set [#44](https://gitlab.miracum.org/miracum/dqa/dqagui/issues/44)
* sql statements to target system, if source=target
#### Refactorings

* adaption to new value conformance results formatting from dqastats
#### Docs

* added docker deployment infos to readme
#### Others

* updated news.md
* preparing cran release v0.2.0
* updated news.md
* added logo to app title
* updated news.md
* updated devstuffs to get auto-changelog working again
* merged
* typo in gui
* updated debugging script
* set argument parallel=FALSE as default
* updated news.md
* updated news.md
* switched debugging to FALSE
* updated version and news.md
* removed rbuildignore from wrong directory
* typo in url
* update debugging scrips
* added diztools version
* better wrapping of dashboard welcome text
* fixed typo in dash-config verbatim
* updated debugging script
* added cran-comments to git-repo
* working on unit tests
* adding more tests
* reducing tests to test only rv object
* fixing unit tests
* setting parallel=FALSE to not fail on windows machines
* added unittests for shiny app

Full set of changes: [`v0.1.9...v0.2.0`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.9...v0.2.0)

## v0.1.9 (2022-02-21)

#### Fixes

* fixing errors leading to failing of just published cran version
#### Others

* updated news.md
* added cran-comments.md
* updated readme to comply with diztools/dizutils
* removed gitlab badges from readme
* added diztools dev-install option to devstuffs

Full set of changes: [`v0.1.8...v0.1.9`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.8...v0.1.9)

## v0.1.8 (2022-02-21)

#### Refactorings

* switch to diztools dependency
#### Others

* updated news.md and readme

Full set of changes: [`v0.1.7...v0.1.8`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.7...v0.1.8)

## v0.1.7 (2022-02-10)

#### Fixes

* modification for cran
* fixed wrong underlying object for text description of plausibility source checks
* removed reshape2 as dependency and replaced code with data.table syntax
* merged development
* env assignment for csv not works. Fixes [#42](https://gitlab.miracum.org/miracum/dqa/dqagui/issues/42) (gitlab)
* added storing of paths to env
* removed custom reset function due to error when starting shiny app
* equal csv paths lead to false assumption of source == target
* removing module-name from inputId for time-restriction slider
#### Docs

* updated example in readme
* preparations for cran submission
* added examples for cran
* updated news.md
#### Others

* updated rbuildignore
* updated package title
* incorporated spell_check results
* removed dep graphics
* removed comment causing linting error
* updated data range in license statement
* revised adding of remotes in devstuffs
* updated news.md
* updated debugging script
* updated news.md
* updated parsing of value_set according to new definition from dqastats
* updated news.md
* switching dqastats dependency to cran
* creating news.md; allow in gitignore; added to rbuildignore
* dev commit after release
* updated gh actions

Full set of changes: [`v0.1.6...v0.1.7`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.6...v0.1.7)

## v0.1.6 (2021-07-01)

#### New Features

* added functionality to provide more than one host for each source system
* added 'everything' as preset for timerange picking
* added time filtering to the gui
#### Fixes

* fixed crash if time restricting column was missing in mdr
* disabling the config tab was broken due to new ids
* fixed bug where no tab was displayed if csv tab was missing
* time support of date-only time-restriction is now valid
#### Refactorings

* updates restricting date calls
#### Others

* moved to central ci-config
* moved to central ci-config
* moved to central ci-config
* ci fixed
* preparation for new release
* small improvements
* ci lints
* linting stuff
* linting fixes
* added `reshape2` as import for displayname lists
* added displaynames for system selection
* updated restricting date calls
* finalized datetime picker and slider
* reverted second gc call on session reload
* adde gc reset
* added second garbage collection after reload
* added background cleaning for app reset
* added garbage collection to reload of the app
* removed debugging prints
* moving towards integration of the datepicker
* starting to add restricting date functionality to the gui
* added R version to gui

Full set of changes: [`v0.1.5...v0.1.6`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.5...v0.1.6)

## v0.1.5 (2021-02-19)

#### New Features

* added waiter to display background actions
* added error handling and shinyalert
* finalized oracle tab
* added oracle tab
#### Fixes

* allow and use (!) custom settings inserted over the UI
* fixed oracle tab bug
* improvement of oracle tab
#### Refactorings

* preparation for new relase
#### Docs

* function description addings
* added changelog
#### Others

* run ci also for new tags
* updated ci for new harbor and base_image
* simplified ci
* switched to dev-base_image for more performance
* changed base_image to speed up
* changed base_image to speed up
* better visualization of mdr table

Full set of changes: [`v0.1.4...v0.1.5`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.4...v0.1.5)

## v0.1.4 (2020-05-07)


Full set of changes: [`v0.1.3...v0.1.4`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.3...v0.1.4)

## v0.1.3 (2020-04-28)


Full set of changes: [`v0.1.2...v0.1.3`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.2...v0.1.3)

## v0.1.2 (2020-04-21)


Full set of changes: [`v0.1.1...v0.1.2`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.1...v0.1.2)

## v0.1.1 (2020-03-20)


Full set of changes: [`v0.1.0...v0.1.1`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.0...v0.1.1)

## v0.1.0 (2020-03-16)


Full set of changes: [`v0.0.7...v0.1.0`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.7...v0.1.0)

## v0.0.7 (2020-02-25)


Full set of changes: [`v0.0.6...v0.0.7`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.6...v0.0.7)

## v0.0.6 (2020-01-29)


Full set of changes: [`v0.0.4...v0.0.6`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.4...v0.0.6)

## v0.0.4 (2019-11-15)


Full set of changes: [`v0.0.3...v0.0.4`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.3...v0.0.4)

## v0.0.3 (2019-11-12)


Full set of changes: [`v0.0.2...v0.0.3`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.2...v0.0.3)

## v0.0.2 (2019-09-27)


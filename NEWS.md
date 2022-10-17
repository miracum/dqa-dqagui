# DQAgui NEWS

## Unreleased (2022-09-26)

#### Refactorings

-   adaptions to deprecation of export\_affected\_ids from dqastats
    ([24139cf](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/24139cf917af91844923c9a86651650118165f4a))
-   namespace imports to zzz.r
    ([8200909](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/82009092b3365053663d9c6c31f92c99ababcb41))
-   returning list when retrieving mdr
    ([24350aa](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/24350aa8ff793fddb9a1c01a53dd2e0c48454d11))

#### CI

-   renamed stage
    ([7b78602](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/7b78602747548fbcfd96fc1e4399255f19d830ee))
-   updated remotes section in description file
    ([0c6d187](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0c6d1879fa37e665cd4280d328824b45fb8bd3e5))
-   updated gha
    ([0589c11](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0589c119b7cff7a2c883b7ad020351455b1f741f))
-   removed gitlab-ci in favor of github actions
    ([b36616e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b36616e81af033dfc5998e38b029a4ae4235865d))
-   added deps for devtools
    ([4e0a090](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/4e0a090dc28b63de85b9052b1aaa086e06dcd9a5))

#### Docs

-   added citation file
    ([b5c52e1](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b5c52e17d7a8704e6ccd971d7163f29c34461156))

#### Other changes

-   updated news.md
    ([6a62176](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6a621762d4d70f62ad48bbc13e631d427ff892d2))
-   updated news.md
    ([6688e2a](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6688e2ae5bc10be6afdcf342fb6293b548a43018))
-   news.md now with autonewsmd package
    ([7b8929c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/7b8929c3c87a1031ab8a7d8fb0266b17494fc44e))
-   doi to package description
    ([02bdd45](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/02bdd45aaff0e67eb1b0cb08adf05f7d15ab24d9))
-   added doi-badge
    ([70b1612](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/70b1612a4ddaabe26ff2aed35b363672830cebbd))
-   updated dev-tag
    ([9b33b49](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/9b33b490af9680aec6da656067f2cacb132a2ccc))

Full set of changes:
[`v0.2.1...24139cf`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.2.1...24139cf)

## v0.2.1 (2022-07-04)

#### New features

-   added demo usage instructions
    ([8dd471b](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/8dd471bf21e480ff25af8ac1ebda42412526f4e5))

#### Bug fixes

-   added ‘nested’-field to list for multiple db instances
    ([3d82b63](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3d82b6324afa6986f9236f786c1b6f0f38b2d6be))
-   displayname to settings
    ([1993e64](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/1993e641d3f542190d6c289243b60da29475f8c6))
-   unnamed list for multiple db instances
    ([362d43f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/362d43fb78fceb029f4f97581e82d1aaffa768b1))
-   fixing population of settings, when multiple db instances defined
    ([b2eb66d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b2eb66dac836f4e6ada75f30cb17ba54208c5b3a))
-   changed naming of prod-env-var-using to re-enable reloading
    ([0c64850](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0c648503dc6498c5091370d642158fae351f9563))
-   tried to fix handing over sql schema and sqlmodify
    ([5b898e6](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/5b898e6ffa21f9902417610023cfdb2a1ad7663f))
-   only showing waiter for report if there was no previous error
    ([b478a92](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b478a92309111005b45034b8f291b7ee1d38fe59))
-   setting envvars before connecting to database \#2
    ([df7ea4a](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/df7ea4a508c698b010bd9d0d00d6cbdede8c9e78))
-   setting envvars before connecting to database
    ([b672bf5](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b672bf57e9bd658507ce37e53978e7209c4786e8))
-   fixes \#43 and \#48
    ([66cce54](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/66cce54c9cebe7859d4994e9270b4b575df3559a))

#### Refactorings

-   refactoring gui\_db\_settings again; removed unnecessary ‘schema’
    and ‘sqlmodify’
    ([ae1ebed](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ae1ebed279450ffb7b1a1fb70d03dcaf13eea0e3))
-   removed demo-usage instruction panel and added link to
    help/instructions in the menu
    ([541b537](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/541b5375ffb090f116ff0db6dd5e946def5d0e4d))
-   switched from “data system” to “database” in wordings
    ([3a1831c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3a1831cdad8b286ee93ef1a7716a11df84f7dcfb))

#### Tests

-   fixed linting errors and unit tests
    ([0c7a4ac](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0c7a4acb522975b78f5ebc79a59ecd5b1bd58676))
-   modularizing unittests due to failing on gha (wip 13)
    ([a8c2c1e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/a8c2c1ecc5899654553ba08d70bebde62d3ca9e4))
-   modularizing unittests due to failing on gha (wip 12)
    ([4afd687](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/4afd68765015eb567021b6bd1c3f3ada0441040b))
-   modularizing unittests due to failing on gha (wip 11)
    ([9713e2d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/9713e2dc186e1ab1dfa2e34fe935cbf221fd9606))
-   modularizing unittests due to failing on gha (wip 10)
    ([6635a97](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6635a978a7a10e0066bad6102693d8ba2c26c853))
-   modularizing unittests due to failing on gha (wip 9)
    ([de1dc6d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/de1dc6d86b1f6ad3de02ff506007bd024d37e51f))
-   modularizing unittests due to failing on gha (wip 8)
    ([cf9399c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/cf9399cead7352f971eeb0c330191e6251d591bb))
-   modularizing unittests due to failing on gha (wip 7)
    ([e94d8f6](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/e94d8f6c45a6cdc3de6cac16c8e3e441304a87a6))
-   modularizing unittests due to failing on gha (wip 6)
    ([267a8b0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/267a8b069dd01b6eb9a88fca2580f38d80d1f993))
-   modularizing unittests due to failing on gha (wip 5)
    ([fb62e21](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/fb62e211fb7617fc4ba8f418c0b2c9661537d49b))
-   modularizing unittests due to failing on gha (wip 4)
    ([dce8583](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/dce8583e2f974c2bb0533d47d146019a50eec7bd))
-   modularizing unittests due to failing on gha (wip 3)
    ([3a1382e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3a1382ecd334cc472a72b9c77dd4d4a59b7c3bb2))
-   modularizing unittests due to failing on gha (wip 2)
    ([adf6538](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/adf65384b1e4b44c217bdf4ef6cd479203364eaf))
-   modularizing unittests due to failing on gha (wip)
    ([7b57a7d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/7b57a7d26be02e52e96886bf02becae3aacef007))
-   modularizing unittests due to failing on gha
    ([26a44e2](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/26a44e2383b13fca337f6d8d2c27b5d3305f775c))
-   fixed linting errors and shiny-app unittests
    ([75c3b93](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/75c3b93a894c07162fa0d953c1a6e1017e21cf0e))

#### CI

-   updated gha (wip 3)
    ([a458aaa](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/a458aaa7334575ee8d9dbd14314c2a94d01f83a6))
-   updated gha (wip 2)
    ([276a0c8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/276a0c8766873a53bc33b77c244c06db3e51e32f))
-   updated gha
    ([033fce0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/033fce012e32d233f10aeae3e0cd58981509082d))

#### Docs

-   added documentation for demo\_usage argument in launch\_app;
    preparing next cran-release
    ([5eb08e8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/5eb08e85c8d22d1c4e00f8b263a3d57992567eec))

#### Other changes

-   prepare cran release v0.2.1
    ([0abd105](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0abd105dbc8cd9100b8e495a7bf817c1f7181254))
-   removed unwanted print message
    ([24516f8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/24516f891099158fa8020797b7313804fdb66ad2))
-   updated metadata to prepare release v0.2.1
    ([939faf7](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/939faf7b405bf524dce622d221f5d6bef01bb5e0))
-   merged fix\_settings\_from\_env to development
    ([418d42b](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/418d42b1134921b24e679ffa97274e0113d30e7e))
-   updated function manual
    ([695a312](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/695a3121284120cd039575ddd96d520cb0d03690))
-   updated news.md and description
    ([2df0da1](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/2df0da169f771b4111fd91b8fce25433ed90b8ae))
-   removed unnecessary pring message
    ([5c57f01](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/5c57f017e64d2439a247b18bb350d780f6b7a8ab))
-   updated news.md; preparing new cran release
    ([2d67f78](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/2d67f7813b6b39e93562e0187aea9064eac6adc6))
-   updated lintr
    ([86f83d8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/86f83d8ba7cf1f660d600c1358409fdc0a13dc8a))
-   added sitename presetting in demo mode
    ([8024a6c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/8024a6c0b094de4e3818c16cd08689f107a559c0))
-   added waiter to wait for report rendering finished and set preset
    for demo-mode in csv list
    ([b7a53a1](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b7a53a1f4b1372a0ed46b19e18a3cc2289d6d1e2))
-   removed shinyapps deployment information
    ([031c365](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/031c365e0185c0939e5e429dd59bc480c791a78f))
-   updated docker files
    ([c772233](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c77223377cec1df24cd4728d808f72a1f4ded4df))
-   uncommented global stuff from shinyapps.io upload
    ([62e9531](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/62e9531df21abec552a62a330da16bf3c8fb0105))
-   updated docker scripts
    ([da6bfd2](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/da6bfd20754a674302c97285ebe1cc61a8b4e4e5))
-   updated R version to R 4.2.0
    ([837b272](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/837b27254b248e4174434e88adbe40a5bab442f5))
-   updated image to R 4.2.0
    ([f9da6f3](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/f9da6f357cd6d4d0a8af6ad6f16f7fa93eb6ad6c))
-   updated new dev version
    ([6c88c5b](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6c88c5bfce7caa2cfd51fee7001ac17eb29e7bc0))

Full set of changes:
[`v0.2.0...v0.2.1`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.2.0...v0.2.1)

## v0.2.0 (2022-05-20)

#### New features

-   added logo
    ([83e808b](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/83e808b79395a74b1ecba5f7a1d6c965896605f6))
-   showing ‘no data available’ in orange color for etl and conformance
    checks
    ([2e3a0f8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/2e3a0f8733f1e94700c619f36be486917d5515a8))
-   added new time-constraint preset - last calendar year
    ([67e8e6e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/67e8e6e1c907ae6fa0929b18b482b66c1270b9f5))
-   added docker deployment
    ([42eed30](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/42eed30202a937541c115ab4e114177cc19f87ac))
-   added more time-frame presets
    ([75822ea](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/75822ea58f4695feef25509996f0e0d2be1e7b1b))
-   adding config info to dashboard
    ([6066b16](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6066b16512a4c1556c5d22ba4d7c5bd49e8f06c2))

#### Bug fixes

-   fixed error when displaying values that violated conformance checks
    ([928f91b](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/928f91b1c1e80376aca5e6cfa2e0a636e5ad1e60))
-   fixed error that occured when no data was available for datetime
    variables for checking
    ([052e65e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/052e65e672b3d8e082df42dd7f82c3fc68e87cce))
-   displayname usage was broken
    ([ed3f455](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ed3f455a982e568d81053f9fcde796dac86946b4))
-   removed link to localhost due to failing r cmd check
    ([3fb88e8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3fb88e8b94ade08da986efd354aad99a4ecc2a5c))
-   added dot\_helper due to failing r cmd check
    ([67a079d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/67a079dd136f575aa7ba9e7c54ff672ec0bd1d4c))
-   displaynames broke in some cases
    ([9884080](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/98840806b2c468b263192436fd2ee4b8c0d566c9))
-   wrong formatting of data restrictions in dq check
    ([c89ffdf](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c89ffdf474017c43a617958023fee51ae181b185))
-   fixes missing system display if displayname was set \#44
    ([3faaf7e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3faaf7e12c20e8e6e24cb2ab15194df61c209868))
-   sql statements to target system, if source=target
    ([58177c5](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/58177c57b4c3fd27b53f0dda72c5580418439f8b))

#### Refactorings

-   adaption to new value conformance results formatting from dqastats
    ([e5c9cf4](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/e5c9cf47b6ae0b4159ee3841a8ed52f5f3ea10bf))

#### Tests

-   working on unit tests
    ([5d05e69](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/5d05e69d8902bf2170ac2546320c4f6760aa4142))
-   adding more tests
    ([8602eca](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/8602eca8a9acc0ec04051ed00c427766f67158f3))
-   reducing tests to test only rv object
    ([2eb2628](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/2eb2628079e0b85a5d2e8e90339ad2e9fefe300b))
-   fixing unit tests
    ([706a248](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/706a248551b50f744d72807c3a18a73ff80c5ba5))
-   setting parallel=FALSE to not fail on windows machines
    ([74b4650](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/74b4650dd0093b5db636f168739840d9d5cb2083))
-   added unittests for shiny app
    ([0fd9038](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0fd90388d6bbe39234cc7c084b98e4b75d2e8fd5))

#### Docs

-   added docker deployment infos to readme
    ([aea74b2](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/aea74b2f98972286aac35f41f51589fb7475e0e4))

#### Other changes

-   updated news.md
    ([3790234](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/37902343d0f347cf8132b46a8e3752638b701da3))
-   preparing cran release v0.2.0
    ([c31fe19](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c31fe19d4e5fadf2c4ddf3fb4d14788f9fe47a47))
-   updated news.md
    ([db40d47](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/db40d47fd70c938ea511eba9b94577aef5274e41))
-   added logo to app title
    ([1203f6e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/1203f6ec8a3c1ef18b318b225f01f588725d9c5b))
-   updated news.md
    ([3c6fea8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3c6fea8b78b39ee3e95fe9da7c0234c32c6b5f2a))
-   updated devstuffs to get auto-changelog working again
    ([283a104](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/283a104359abe34bdae3432808b4bc17bed2ef20))
-   merged
    ([6cae04e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6cae04e9b5cf7f1e2ce4aab18be7184b4be55ec5))
-   typo in gui
    ([34cfee9](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/34cfee922c382df9b2db9c2ee7626900f9111dcc))
-   updated debugging script
    ([052f559](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/052f559ae9489159c739293d5ae28b1d6cdce784))
-   set argument parallel=FALSE as default
    ([ed87254](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ed87254692cb7f6460ee808dd15d5fe18c00725d))
-   updated news.md
    ([55073b6](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/55073b62260670865a33bbc66a4847a2799e2fb8))
-   updated news.md
    ([60092aa](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/60092aa2433ceac5e53f71ad39c36b40d572143c))
-   switched debugging to FALSE
    ([3606301](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/360630134bff63dadcbc2b09a1d29492b673046e))
-   updated version and news.md
    ([a1eec63](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/a1eec6313f5f3acb9f14288c29f3e6f0f107a890))
-   removed rbuildignore from wrong directory
    ([04fc2fc](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/04fc2fc228a576f0a4fd6f857bad714c389186ec))
-   typo in url
    ([d48f994](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/d48f9943a8b31cfd90a1a411330a24050848b4fd))
-   update debugging scrips
    ([ba50d2f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ba50d2f23d30e4df078f756256c25cca717228de))
-   added diztools version
    ([49e9e4c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/49e9e4c8385fa1b9fee198eb8dd33a9ead6e8c0c))
-   better wrapping of dashboard welcome text
    ([117c15a](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/117c15ae80767f2105afc0cd16161992199a4b88))
-   fixed typo in dash-config verbatim
    ([103cb83](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/103cb8330f8a5aa825553f6a32a0b36f92c696fe))
-   updated debugging script
    ([e04e6c0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/e04e6c081a732122990da275552ef631549d65ca))
-   added cran-comments to git-repo
    ([f34ebe8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/f34ebe8cec38c384c1caa1b433bf969cb955d489))

Full set of changes:
[`v0.1.9...v0.2.0`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.9...v0.2.0)

## v0.1.9 (2022-02-21)

#### Bug fixes

-   fixing errors leading to failing of just published cran version
    ([330abd9](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/330abd9b024d04af33307b71fe8fb854c1681885))

#### Other changes

-   updated news.md
    ([b7c146c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b7c146cc99efc3c07de7831ffff77fe27fd61021))
-   added cran-comments.md
    ([c62c2a3](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c62c2a35f912724d14f311ba0a4a508e735e3dbc))
-   updated readme to comply with diztools/dizutils
    ([257f524](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/257f5244fedbf669ff7d31c966ca786a112894a9))
-   removed gitlab badges from readme
    ([1fcfd59](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/1fcfd59b65ea774708b4f3de200bc8334153a8f0))
-   added diztools dev-install option to devstuffs
    ([076cd61](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/076cd61aca81a3e6e259b4f6e7151cd2df7d545b))

Full set of changes:
[`v0.1.8...v0.1.9`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.8...v0.1.9)

## v0.1.8 (2022-02-21)

#### Refactorings

-   switch to diztools dependency
    ([6714b4f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6714b4f18a066efa31b99ecdd6a648517fc5d0b2))

#### Other changes

-   updated news.md and readme
    ([d53af4f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/d53af4fb1ce2828c50ac8c962851e7ed68338593))

Full set of changes:
[`v0.1.7...v0.1.8`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.7...v0.1.8)

## v0.1.7 (2022-02-10)

#### Bug fixes

-   modification for cran
    ([ef28652](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ef286525ffc0493f14c8fbe05620460c4adb3152))
-   fixed wrong underlying object for text description of plausibility
    source checks
    ([b1b417a](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b1b417acb1383c7619a158c66e3d8e938fda21c8))
-   removed reshape2 as dependency and replaced code with data.table
    syntax
    ([b904120](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b904120686780a9be8fa82a7404926cf2c256cbe))
-   merged development
    ([82ca1bc](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/82ca1bc14bdfe539fcda356ca025622c0340b51c))
-   env assignment for csv not works. Fixes \#42 (gitlab)
    ([10561a5](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/10561a582f8442e46d154bd9b1894502a925a352))
-   added storing of paths to env
    ([e8cf728](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/e8cf7286123616bdad1c4fa27fc0db2441c94dfb))
-   removed custom reset function due to error when starting shiny app
    ([48f21fb](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/48f21fb1d444f4e95365ea6458f02efcb813b0ea))
-   equal csv paths lead to false assumption of source == target
    ([21e9055](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/21e9055ad2cfdcdd0cb674f052db6810fe49f725))
-   removing module-name from inputId for time-restriction slider
    ([602c82c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/602c82cdd56f10bdb285dbf78b78fbd0b4d741e4))

#### Tests

-   updated gh actions
    ([9a6d4d9](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/9a6d4d9bc9743e7d72e375c8c22e9cbce19c5f6e))

#### Docs

-   updated example in readme
    ([b21c21c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b21c21c4f645f2517151adeeb79a4fd1217b9380))
-   preparations for cran submission
    ([349678c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/349678c90fff22e19aae69ccbefb6a47fa7184d4))
-   added examples for cran
    ([758ada8](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/758ada882e414b4e9e359beb02e9b884c019c4ce))
-   updated news.md
    ([7564fa3](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/7564fa3f4d710897d84818af79096caa59936af1))

#### Other changes

-   updated rbuildignore
    ([fd1c2dd](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/fd1c2dd80d1b820512341a4df6fecede580709b9))
-   updated package title
    ([8ab8940](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/8ab8940dc0d8a11bc38ec7c7387afadb7d21c79e))
-   incorporated spell\_check results
    ([b29c022](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b29c0225701f7bea01033598bf5d9a86f7294fc2))
-   removed dep graphics
    ([2f2d872](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/2f2d8723aaa68890a5d2b3dc3df905243a48b088))
-   removed comment causing linting error
    ([04aa5c0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/04aa5c09abbc5dd17a14fd7d36c826965cd7cb8b))
-   updated data range in license statement
    ([c6883db](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c6883db37797b04bebb1cbb0ba0c69ba484da9be))
-   revised adding of remotes in devstuffs
    ([6b5216d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6b5216db9cfcbe16f2b92447ebd111fc401e4da3))
-   updated news.md
    ([73855af](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/73855af81c19e72fb5f12c25aa27c719a5c0331a))
-   updated debugging script
    ([7f50fe4](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/7f50fe424fbb48fee8c4d34061bafa86009df164))
-   updated news.md
    ([6b5b959](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6b5b959b14d903455af8bd6da34db4fd13879a1e))
-   updated parsing of value\_set according to new definition from
    dqastats
    ([f343c5f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/f343c5fc6f5ddf9f55a850f512474292c7619e5e))
-   updated news.md
    ([752ff6f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/752ff6f2224de2a65d7bfa2badee3df5e058f041))
-   switching dqastats dependency to cran
    ([e75bc04](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/e75bc041c7ff42d9862d85f75ec3049c40571da6))
-   creating news.md; allow in gitignore; added to rbuildignore
    ([c2b7363](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c2b7363510e7006ffafb1e6d248b86159a46b5e6))
-   dev commit after release
    ([49862c1](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/49862c19fbf1981d443f8ff6bba0284767216d55))

Full set of changes:
[`v0.1.6...v0.1.7`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.6...v0.1.7)

## v0.1.6 (2021-07-01)

#### New features

-   added functionality to provide more than one host for each source
    system
    ([ee6f056](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ee6f05691f6f30dcd7e1ed5ebeba6b960adb647e))
-   added ‘everything’ as preset for timerange picking
    ([b5c932d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b5c932d220f5d2d30fa5c9010984baa4bab65866))
-   added time filtering to the gui
    ([56b2794](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/56b2794a448f4729407e913169d8aae591f644ca))

#### Bug fixes

-   fixed crash if time restricting column was missing in mdr
    ([691a667](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/691a66770e75f6e10437858b4c26ef2028185c66))
-   disabling the config tab was broken due to new ids
    ([3e54c53](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3e54c5337d0f93fb8c639bfe6a16ab22b4d40e00))
-   fixed bug where no tab was displayed if csv tab was missing
    ([3f7e13b](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/3f7e13b145935cf1b9149fe4770e23fe97c3ecde))
-   time support of date-only time-restriction is now valid
    ([42a6773](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/42a6773cd42366744075743ff4541b9d3a937abd))

#### Refactorings

-   updates restricting date calls
    ([baf199d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/baf199d06da5c0fed1e1c6a64d6f61ba6f057db2))

#### CI

-   moved to central ci-config
    ([149849d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/149849dc8a5f6402007dafb0d0e613a6903960d4))
-   moved to central ci-config
    ([f228455](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/f22845510d0a6c629cab865e09db96d5fac43468))
-   moved to central ci-config
    ([dbf8fad](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/dbf8fadaefee72191c7a3a0bde6f99f4abcdda10))

#### Style

-   added R version to gui
    ([c3a6ff4](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c3a6ff45610ccbd6c346deabb8672c55964edcc2))

#### Other changes

-   ci fixed
    ([90482b6](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/90482b6c1fa1fc74c8a1f0c0bc610462abdb73ee))
-   preparation for new release
    ([00538c1](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/00538c1deec0d6daabaf597dd314a1264b5f1673))
-   small improvements
    ([6544cc3](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6544cc39fc9ad4c8ae40a2565565f5b824258b0e))
-   ci lints
    ([efb6de4](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/efb6de47291e493a16d677d6a86c9c132bde7fc7))
-   linting stuff
    ([6bd6ae0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/6bd6ae06c5ea747a454a37548768180af86c53c1))
-   linting fixes
    ([acd432c](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/acd432ce26857c59ee983266272c1209ce0570d6))
-   added `reshape2` as import for displayname lists
    ([07f8d50](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/07f8d502799e850ae79fa16a7c41f1af0b02d650))
-   added displaynames for system selection
    ([fd5c3e9](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/fd5c3e9c1e39a5ac2cddf61b4a58c62eeb7f57cc))
-   updated restricting date calls
    ([b797034](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b797034527c52a85ae405958e7b9add4ec45e60b))
-   finalized datetime picker and slider
    ([ecefcc5](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ecefcc5f32160ae1122ff53e86323220d3cc3e18))
-   reverted second gc call on session reload
    ([438270d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/438270df6e0702967e50484f26196f9f72eaf8b0))
-   adde gc reset
    ([cc8c045](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/cc8c04503ae9d17eaf401021507278c3531aff55))
-   added second garbage collection after reload
    ([c0fd1b6](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c0fd1b600dba486cb815ca1c85ea41b382a9342f))
-   added background cleaning for app reset
    ([9b3866e](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/9b3866ef70e5958fb7c041b998955c6800d6ce9f))
-   added garbage collection to reload of the app
    ([471e521](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/471e521787dce38d4e4138e71cc1de855ef580da))
-   removed debugging prints
    ([c267b95](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/c267b9506127f2d2b0ac4a20e740857545662eff))
-   moving towards integration of the datepicker
    ([335b0d3](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/335b0d36112c0ca29e31e3cef151b8fc0f7a1ab8))
-   starting to add restricting date functionality to the gui
    ([786f874](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/786f874ab9eee776e26024306d5a9310de23faa9))

Full set of changes:
[`v0.1.5...v0.1.6`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.5...v0.1.6)

## v0.1.5 (2021-02-19)

#### New features

-   added waiter to display background actions
    ([faa0a31](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/faa0a31df7be82a42652b2b7dbdf1de568e44e56))
-   added error handling and shinyalert
    ([4ffd5b3](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/4ffd5b3d4968442a7ec2fe9f00e4acce4d985f73))
-   finalized oracle tab
    ([dc740dc](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/dc740dc6747f182fdac0b37b5f7a0f1ebe0a5a12))
-   added oracle tab
    ([ad19c03](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/ad19c031721f762b7908263d55c428cdbf16291b))

#### Bug fixes

-   allow and use (!) custom settings inserted over the UI
    ([14e435d](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/14e435dbfd6b440c9d8c5fb4c4ca32b366c10026))
-   fixed oracle tab bug
    ([e0438d0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/e0438d03b44144bdcd47e63d1a5b7ecd0a7156d1))
-   improvement of oracle tab
    ([4e5e2a0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/4e5e2a050b4dd202bd9d49349ca3dc68671a5143))

#### Refactorings

-   preparation for new relase
    ([4a79ad6](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/4a79ad646458d127e12620d121ba5f2c36a2ad2c))

#### CI

-   run ci also for new tags
    ([775e90f](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/775e90f06c00e405e328e61344cdca9b31077a18))
-   updated ci for new harbor and base\_image
    ([86c6f02](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/86c6f020201795a2f7c5a1ee3d519dabc6111369))
-   simplified ci
    ([319c351](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/319c351f3a1001599e5c650d556a08bb2c34a7b5))
-   switched to dev-base\_image for more performance
    ([f4c36c4](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/f4c36c48580f95127973494f9329891b9dc47ce5))
-   changed base\_image to speed up
    ([0e19be0](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/0e19be08366741918225c2eb8d41eda5bd587c30))
-   changed base\_image to speed up
    ([b4f6e5a](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/b4f6e5a0d6181169c9a9c9dbc2e1367a62b05095))

#### Docs

-   function description addings
    ([85122fc](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/85122fc4972ba86d9befb36d66da1d02f0d4a1f8))
-   added changelog
    ([7f4f992](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/7f4f9923057cde1306423fa72fa7386b4bc8f23d))

#### Style

-   better visualization of mdr table
    ([5049b4a](https://gitlab.miracum.org/miracum/dqa/dqagui/tree/5049b4a249b321edcb8fe54218c5de055b4e2c1a))

Full set of changes:
[`v0.1.4...v0.1.5`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.4...v0.1.5)

## v0.1.4 (2020-05-07)

Full set of changes:
[`v0.1.3...v0.1.4`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.3...v0.1.4)

## v0.1.3 (2020-04-28)

Full set of changes:
[`v0.1.2...v0.1.3`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.2...v0.1.3)

## v0.1.2 (2020-04-21)

Full set of changes:
[`v0.1.1...v0.1.2`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.1...v0.1.2)

## v0.1.1 (2020-03-20)

Full set of changes:
[`v0.1.0...v0.1.1`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.1.0...v0.1.1)

## v0.1.0 (2020-03-16)

Full set of changes:
[`v0.0.7...v0.1.0`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.7...v0.1.0)

## v0.0.7 (2020-02-25)

Full set of changes:
[`v0.0.6...v0.0.7`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.6...v0.0.7)

## v0.0.6 (2020-01-30)

Full set of changes:
[`v0.0.4...v0.0.6`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.4...v0.0.6)

## v0.0.4 (2019-11-15)

Full set of changes:
[`v0.0.3...v0.0.4`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.3...v0.0.4)

## v0.0.3 (2019-11-12)

Full set of changes:
[`v0.0.2...v0.0.3`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.2...v0.0.3)

## v0.0.2 (2019-09-27)

Full set of changes:
[`v0.0.2.9000...v0.0.2`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.2.9000...v0.0.2)

## v0.0.2.9000 (2019-08-30)

Full set of changes:
[`v0.0.1.9000...v0.0.2.9000`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.1.9000...v0.0.2.9000)

## v0.0.1.9000 (2019-08-20)

Full set of changes:
[`v0.0.0.9003...v0.0.1.9000`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.0.9003...v0.0.1.9000)

## v0.0.0.9003 (2019-08-14)

Full set of changes:
[`v0.0.0.9002...v0.0.0.9003`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/v0.0.0.9002...v0.0.0.9003)

## v0.0.0.9002 (2019-08-08)

Full set of changes:
[`3025380...v0.0.0.9002`](https://gitlab.miracum.org/miracum/dqa/dqagui/compare/3025380...v0.0.0.9002)

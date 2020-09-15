{ mkDerivation, aeson, base, binary, blaze-markup, brittany
, bytestring, containers, data-default, deepseq, directory, extra
, fetchgit, filepath, floskell, fourmolu, ghc, ghc-boot-th
, ghc-paths, ghcide, gitrev, hashable, haskell-lsp, hie-bios
, hls-plugin-api, hslogger, hspec, hspec-core, lens, lsp-test
, optparse-applicative, optparse-simple, ormolu, process
, regex-tdfa, retrie, safe-exceptions, shake, stdenv, stm
, stylish-haskell, tasty, tasty-ant-xml, tasty-expected-failure
, tasty-golden, tasty-hunit, tasty-rerun, temporary, text, time
, transformers, unordered-containers, yaml
}:
mkDerivation {
  pname = "haskell-language-server";
  version = "0.4.0.0";
  src = fetchgit {
    url = "https://github.com/haskell/haskell-language-server.git";
    sha256 = "1mfm9zhnf64iy3ys3z6pblvsyj7p6vs29nkb0cfq0k6352isb3cg";
    rev = "34eff9652da4f9bc7ec1a1d0a41d90e29202ed23";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base containers data-default directory extra filepath ghc ghcide
    gitrev haskell-lsp hie-bios hls-plugin-api hslogger
    optparse-applicative optparse-simple process text
    unordered-containers
  ];
  executableHaskellDepends = [
    aeson base binary brittany bytestring containers deepseq directory
    extra filepath floskell fourmolu ghc ghc-boot-th ghc-paths ghcide
    gitrev hashable haskell-lsp hie-bios hls-plugin-api lens
    optparse-applicative optparse-simple ormolu process regex-tdfa
    retrie safe-exceptions shake stylish-haskell temporary text time
    transformers unordered-containers
  ];
  testHaskellDepends = [
    aeson base blaze-markup bytestring containers data-default
    directory extra filepath haskell-lsp hie-bios hls-plugin-api
    hslogger hspec hspec-core lens lsp-test process stm tasty
    tasty-ant-xml tasty-expected-failure tasty-golden tasty-hunit
    tasty-rerun temporary text transformers unordered-containers yaml
  ];
  testToolDepends = [ ghcide ];
  homepage = "https://github.com/haskell/haskell-language-server#readme";
  description = "LSP server for GHC";
  license = stdenv.lib.licenses.asl20;
}

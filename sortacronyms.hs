#!/usr/bin/env runhaskell
import Control.Arrow ((&&&))
import Data.Bifunctor (second)
import Data.Char (toUpper)
import Data.Function (on)
import Data.List (nub, sortBy)

chap_intro :: [(String, String)]
chap_intro = [("DSL", "Domain-Specific Language")]

chap_background :: [(String, String)]
chap_background = []

chap_high_assurance :: [(String, String)]
chap_high_assurance = []

chap_jasmin :: [(String, String)]
chap_jasmin = [("CT", "Constant-Time"), ("SCT", "Speculative Constant-Time")]

chap_impl :: [(String, String)]
chap_impl = []

chap_concl :: [(String, String)]
chap_concl = [("NIST", "National Institute of Standards and Technology")]

acronyms :: [(String, String)]
acronyms =
    nub $
    mconcat [chap_intro, chap_background, chap_high_assurance, chap_jasmin, chap_impl, chap_concl]

main :: IO ()
main =
    writeFile "acros.tex" . concat $
    map ((\(a, s) -> concat ["\\acro{", a, "}{", s, "}\n"])) $
    sortBy (compare `on` (map toUpper . fst)) acronyms

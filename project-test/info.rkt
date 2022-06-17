#lang info

(define collection "<project>")
(define deps '("base"))
(define build-deps '("<project>-lib"
                     "rackunit-lib"
                     "cover"
                     "cover-coveralls"))
(define version "0.0")
(define pkg-authors '(<username>))
(define clean '("compiled" "tests/compiled"))

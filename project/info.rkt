#lang info

(define version "0.0")
(define collection 'multi)
(define deps '("base"
               "<project>-lib"
               "<project>-doc"
               "<project>-test"))
(define build-deps '())
(define implies '("<project>-lib"
                  "<project>-doc"
                  "<project>-test"))

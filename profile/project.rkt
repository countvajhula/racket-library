#lang racket/base

(require <project>
         racket/list
         racket/format)

(define-syntax-rule (values->list body0 body ...)
  (call-with-values (λ () body0 body ...) list))

(define (check-value fn how-many [inputs (list "A" "B" "C")])
  (for ([i (in-cycle inputs)]
        [_ how-many])
    (fn i)))

(define (measure fn . args)
  (second (values->list (time-apply fn args))))

(define-syntax-rule (profile f-name n-times)
  (let ([ms (measure check-value f-name n-times)])
    (displayln (~a 'f-name ": " ms " ms"))))

(module+ main
  (profile hello 100000))

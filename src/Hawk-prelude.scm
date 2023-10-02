(define make-bytevector make-string)
(define (bytevector-u8-set! bv i val)
  (string-set! bv i (integer->char val)))
(define (utf8->string v) v)
(define (string->utf8 v) v)
(define (this-scheme-implementation-name)
  (string-append "boom-" "0.1"))
(define (inexact a) (exact->inexact a))
(define (inexact->exact a) a)
(define (exact a) (inexact->exact a))
(define (square n) (* n n))
(define (jiffies-per-second)
  1000000000 ;; returns 1 on my Bones, which is wrong. this number should work for ?many? linuxen
  )
;; vector-map
;; read-line
;; complex/rational functions
;; define-record-type
(define-syntax import
  (syntax-rules ()
    ((import stuff ...)
     (begin) ;; do nothing
     )))
(define-syntax when
  (syntax-rules ()
    ((when a b c ...)
     (if a (begin b c ...)))))
(define-syntax unless
  (syntax-rules ()
    ((unless a b c ...)
     (if (not a) (begin b c ...)))))
(define (jiffies-per-second) 1)
(define (current-jiffy) (with-input-from-file "/proc/uptime" read))
(define (current-second) (with-input-from-file "/proc/uptime" read))
;;(define (current-jiffy) 0)
;;(define (current-second) 0)



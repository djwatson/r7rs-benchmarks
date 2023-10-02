(import (chezscheme))
(define (current-jiffy) (with-input-from-file "/proc/uptime" read))
(define (current-second) (with-input-from-file "/proc/uptime" read))
(define (jiffies-per-second) 1)






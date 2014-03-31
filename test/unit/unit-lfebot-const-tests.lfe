(defmodule unit-lfebot-const-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest config-name
  (is-equal 'lfebot (lfebot-const:config-name)))

(deftest endline
  (is-equal #B("\r\n") (lfebot-const:endline)))

(deftest reconnect-time
  (is-equal 30000 (lfebot-const:reconnect-time)))

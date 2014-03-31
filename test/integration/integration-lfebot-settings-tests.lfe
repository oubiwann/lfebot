(defmodule integration-lfebot-settings-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest get-section
  (is-equal '(#("nick" "LiffyBot")) (lfebot-settings:get-section 'nick-plugin)))

(deftest get-value
  (is-equal '"LiffyBot" (lfebot-settings:get-value 'nick-plugin 'nick)))

(deftest get-integer
  (is-equal 6667 (lfebot-settings:get-integer 'lfebot 'port)))

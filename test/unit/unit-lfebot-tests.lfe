(defmodule unit-lfebot-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest code-change
  (is-equal
    #(ok "state")
    (: lfebot-server code_change
       '"old version"
       '"state"
       '"extra")))

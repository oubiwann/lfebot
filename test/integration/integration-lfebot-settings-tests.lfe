(defmodule integration-lfebot-settings-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest get-apps
  ;; check before anything is set up
  (is-equal '(kernel stdlib) (lfebot-settings:get-apps)))

;; XXX add test for lfebot-settings:register

(deftest start-config
  ;; check before anything is set up
  (is-equal '(kernel stdlib) (lfebot-settings:get-apps))
  ;; bring up the apps for econfig
  (lfebot-settings:start-config)
  ;; check again, now that the apps are set up
  (is-equal '(econfig gproc kernel stdlib) (lfebot-settings:get-apps)))

;; XXX add test for lfebot-settings:get-status

(deftest get-running
  ;; check before anything is set up
  (is-equal '() (lfebot-settings:get-running))
  ;; bring up the apps for econfig
  (lfebot-settings:start-config)
  ;; check again, now that the apps are set up
  (is-equal '(econfig gproc) (lfebot-settings:get-running)))

(deftest running?
  ;; check before anything is set up
  (is-equal 'false (lfebot-settings:running?))
  ;; bring up the apps for econfig
  (lfebot-settings:start-config)
  ;; check again, now that the apps are set up
  (is-equal 'true (lfebot-settings:running?)))

;; XXX add test for lfebot-settings:setup

(deftest get-section
  (is-equal '(#("nick" "LiffyBot")) (lfebot-settings:get-section 'nick-plugin)))

(deftest get-value
  (is-equal '"LiffyBot" (lfebot-settings:get-value 'nick-plugin 'nick)))

(deftest get-integer
  (is-equal 6667 (lfebot-settings:get-integer 'lfebot 'port)))

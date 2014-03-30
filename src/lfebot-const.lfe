(defmodule lfebot-const
  (export all))

(defun endline ()
  (binary "\r\n"))

(defun reconnect-time ()
  "30 seconds."
  (* (lfebot-settings:get-value 'lfebot 'reconnect-seconds) 1000))

(defmodule lfebot-send
  (export
    (channel 2)
    (priv 2)
    (raw 1)
    (raw-unterminated 1)))

(defun channel (arg1 arg2)
  'noop)

(defun priv (arg1 arg2)
  'noop)

(defun raw (arg)
  'noop)

(defun raw-unterminated (arg)
  'noop)

(defmodule lfebot-router
  (behaviour gen_server)
  ;; API
  (export (add-subscriber 1)
          (connect 2)
          (remove-subscriber 1)
          (send 1)
          (start_link 1)
          (stop-bot 0)
          ;; Don't call the following unless you really know what you're doing
          (connected 0)
          (disconnected 0)
          (receive-raw 1))
  ;; gen_server callbacks
  (export (init 1)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (terminate 2)
          (code_change 3)))

(include-lib "include/records.lfe")

;;;===================================================================
;;; API
;;;===================================================================
(defun add-subscriber (pid)
  (erlang:monitor 'process pid)
  (gen_server:call 'bot-router `#(add-subscriber ,pid)))

(defun connect (_ _)
  'noop)

(defun remove-subscriber (pid)
  (gen_server:call 'bot-router `#(remove-subscriber ,pid)))

(defun send (_)
  'noop)

(defun start_link (cmd-word)
  (gen_server:start_link #(local bot-router) (MODULE) (list cmd-word) '()))

(defun stop-bot ()
  'noop)

;;;===================================================================
;;; API, but don't call; really for internal use
;;;===================================================================
(defun connected ()
  'noop)

(defun disconnected ()
  'noop)

(defun receive-raw (_)
  'noop)

;;;===================================================================
;;; gen_server callbacks
;;;===================================================================
(defun init (cmd-word)
  `#(ok ,(make-router-state cmd-word (list_to_binary cmd-word))))

(defun handle_call (_ _ _)
  'noop)

(defun handle_cast (_ _)
  'noop)

(defun handle_info (_ _)
  'noop)

(defun terminate (_ _)
  'noop)

(defun code_change (_ _ _)
  'noop)

;;;===================================================================
;;; Internal functions
;;;===================================================================
(defun message-subscriber (subscriber pid)
  'noop)

(defun remove-subscriber (subscriber pid)
  )

(defun split-nick (nick)
  'noop)

(defun parse-irc (arg)
  'noop)

(defun parse-irc (prefix rest)
  'noop)

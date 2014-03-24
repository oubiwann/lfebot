(defmodule lfebot-connector
  (behaviour gen_server)
  ;; API
  (export (connect 2)
          (send 1)
          (start_link 1)
          (stop-bot 0))
  ;; gen_server callbacks
  (export (init 1)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (terminate 2)
          (code_change 3)))

(defrecord state
  server
  port
  socket)

(defun server-name ()
  (MODULE))

(defun reconnect-time ()
  "30 seconds."
  30000)

;;;===================================================================
;;; API
;;;===================================================================
(defun start_link
  (((list server port))
    (: gen_server start_link
       (tuple 'local (server-name)) (MODULE) `(,server ,port) '())))

(defun connect (host port)
  'noop)

(defun send (line)
  (: gen_server cast
     (server-name) `#(raw_send ,line)))

(defun stop-bot ()
  (: gen_server call (server-name) 'terminate))

;;;===================================================================
;;; gen_server callbacks
;;;===================================================================
(defun init
  (((list server port))
    (process_flag 'trap_exit 'true)
    (connect server port)
    ; XXX use lager ... to give started message
    (tuple ok (make-state server server port port))))

(defun handle_call
  (((tuple 'test message) from state)
    (: lfe_io format '"Call: ~p~n" (list message))
    (tuple 'reply 'ok state))
  ((request from state)
    (tuple 'reply 'ok state)))

(defun handle_cast
  (((tuple 'test message) state)
    (: lfe_io format '"Cast: ~p~n" (list message))
    (tuple 'noreply state))
  ((message state)
    (tuple 'noreply state)))

(defun handle_info (info state)
  (tuple 'noreply state))

(defun terminate (reason state)
  'ok)

(defun code_change (old-version state extra)
  (tuple 'ok state))

;;;===================================================================
;;; Internal functions
;;;===================================================================
(defun flush ()
  "Flush all messages so they dont queue up."
  'noop)

(defun reconnect ()
  ; XXX use lager here to give reconnecting message)
  (: erlang send_after (reconnect-time)))

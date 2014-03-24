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
     (server-name) (tuple 'test message)))

(defun stop-bot ()
  (: gen_server call (server-name) 'terminate))

;;;===================================================================
;;; gen_server callbacks
;;;===================================================================
(defun init (args)
  (tuple 'ok (make-state)))


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

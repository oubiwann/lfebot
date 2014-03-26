(defmodule lfebot-server
  (behaviour gen_server)
  ;; API
  (export (start_link 0)
          (test-call 1)
          (test-cast 1))
  ;; gen_server callbacks
  (export (init 1)
          (handle_call 3)
          (handle_cast 2)
          (handle_info 2)
          (terminate 2)
          (code_change 3)))

(defrecord state
  (data (tuple)))

(defun server-name ()
  'lfebot-server)

;;;===================================================================
;;; API
;;;===================================================================
(defun start_link ()
  (gen_server:start_link
     (tuple 'local (server-name)) (MODULE) '() '()))

(defun test-call (message)
  (gen_server:call
     (server-name) (tuple 'test message)))

(defun test-cast (message)
  (gen_server:cast
     (server-name) (tuple 'test message)))

;;;===================================================================
;;; gen_server callbacks
;;;===================================================================
(defun init (args)
  (tuple 'ok (make-state)))


(defun handle_call
  (((tuple 'test message) from state)
    (lfe_io:format '"Call: ~p~n" (list message))
    (tuple 'reply 'ok state))
  ((request from state)
    (tuple 'reply 'ok state)))

(defun handle_cast
  (((tuple 'test message) state)
    (lfe_io:format '"Cast: ~p~n" (list message))
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

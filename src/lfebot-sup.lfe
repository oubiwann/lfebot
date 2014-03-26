(defmodule lfebot-sup
  (behaviour supervisor)
  ;; API
  (export (start_link 0))
  ;; Supervisor callbacks
  (export (init 1)))

(defun server-name ()
  (MODULE))

(defun start_link ()
  (supervisor:start_link
    (tuple 'local (server-name)) (MODULE) '()))

(defun init (args)
  (let* ((command-word (lfebot-settings:get-value 'lfebot 'command-word))
         (irc-server (lfebot-settings:get-value 'lfebot 'server))
         (irc-port (lfebot-settings:get-value 'lfebot 'port))
         (start-order (list (child 'lfebot-router 'worker command-word)
                            (child 'lfebot-plugin-sup 'supervisor '())
                            (child 'lfebot-connector 'worker
                              (list irc-server irc-port)))))
    `#(ok #(#(one_for_one 5 10) ,start-order))))

(defun child
  "Helper function for declaring children of supervisor."
  ((mod 'supervisor '())
    `#(,mod #(,mod start_link ()) permanent 5000 supervisor (,mod)))
  ((mod type '())
    `#(,mod #(,mod start_link ()) permanent infinity ,type (,mod)))
  ((mod type args)
    `#(,mod #(,mod start_link (,args)) permanent 5000 ,type (,mod))))

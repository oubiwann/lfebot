(defmodule lfebot-util
  (export all))

(defun timestamp ()
  (timestamp (now)))

(defun timestamp (time)
  (let* (((tuple (tuple year mon day)
                 (tuple hour min sec)) (calendar:now_to_local_time time))
         (stamp (io_lib:format "~4..0w-~2..0w-~2..0w ~2..0w:~2..0w:~2..0w"
                               (list year mon day hour min sec))))
    (list_to_binary stamp)))

(defun format-irc-line (nick line)
  (binary ((timestamp) binary)
          " <" (nick binary) "> "
          (line binary)))

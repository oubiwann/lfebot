;; Used in lfebot-connector
(defrecord bot-state
  server
  port
  socket)

;; Used in the following:
;;  * lfebot-router
;;  * lfebot-plugin-sup
;;  * lfebot-ping-plugin
(defrecord irc-message
  (prefix (binary))
  (command (binary))
  (args (binary)))

;; Used in lfebot-router
(defrecord router-state
  (subscribers (list))
  cmd-word)

;; Used in lfebot-nick-plugin
(defrecord nick-state
  pref-nick
  current-nick
  (nick-number 0))

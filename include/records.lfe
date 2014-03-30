(defrecord state
  server
  port
  socket)

(defrecord irc-message
  (prefix (binary))
  (command (binary))
  (args (binary)))

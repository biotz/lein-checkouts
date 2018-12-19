(ns endpoint1.core)

(defn foo
  "I don't do a whole lot."
  [x]
  {:headers {"content-type" "text/html"}
   :status 200
   :body "Hello! 123456"})

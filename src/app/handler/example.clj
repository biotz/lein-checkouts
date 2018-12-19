(ns app.handler.example
  (:require [compojure.core :refer :all]
            [integrant.core :as ig]
            [endpoint1.core]))

(defmethod ig/init-key :app.handler/example [_ options]
  (context "/example" req
    (GET "/" req
      (endpoint1.core/foo req))))

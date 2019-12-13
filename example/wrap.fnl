(local repl (require "lib.stdio"))
(local [w h] [400 400])
(love.window.setMode w h {:vsync true :stencil true})
(local canvas  (love.graphics.newCanvas w h))

(local gamera (require "gamera"))


(global cam (-> (gamera.new 0 0 2000 2000)
                (gamera.setPosition 100 200)
                (gamera.setWindow 100 0 300 400)))

;; (cam:setWorld 0 0 2000 200)
;; (cam:setWindow 100 0 300 400)
;; (cam:setPosition 100 200)


(fn love.load []
  (canvas:setFilter "nearest" "nearest")

  (repl.start))

(fn love.draw []
  ;; the canvas allows you to get sharp pixel-art style scaling; if you
  ;; don't want that, just skip that and call mode.draw directly.
  (love.graphics.setCanvas canvas)
  (love.graphics.clear)
  (love.graphics.setColor 1 1 1)
  (gamera.draw cam
               (fn [l t w h]
                 (love.graphics.setColor 0 1 1 1)
                 (love.graphics.rectangle "fill" 0 0 2000 2000)))

  (love.graphics.setCanvas)
  (love.graphics.setColor 1 1 1)
  (love.graphics.draw canvas 0 0 0 1 1))

(fn love.update [dt]
  )

(fn love.keypressed [key]
  (if (and (love.keyboard.isDown "lctrl" "rctrl" "capslock") (= key "q"))
      (love.event.quit)
      ;; add what each keypress should do in each mode
      ))

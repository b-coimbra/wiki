(define-typed-syntax lam
  [(_ (x:id) e) ⇐ (~→ A B ~!) ≫
   [[x ≫ x- : A] ⊢ e ≫ e- ⇐ B]
   --------
   [⊢ (λ- (x-) e-)]]

  [_ ⇐ (~not #f) ≫
   --------
   [≻ (chk #,this-syntax)]]

  [(_ (x:id) e ~!) ≫
   #:with α (make-exis)
   #:with β (make-exis)
   #:do [(context-push! #'α #'β #'(Marker α))]
   [[x ≫ x- : α] ⊢ e ≫ e- ⇐ β]
   #:do [(context-pop-until! (~Marker (~Exis= #'α)))]
   --------
   [⊢ (λ- (x-) e-) ⇒ (→ α β)]])

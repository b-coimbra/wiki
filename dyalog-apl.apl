fib←{⎕ml←3
    ⍵≤2:1

    {(+/∧\⍵='0')↓⍵
    },'ZI9'⎕fmt(⍵-2){
        ⍺>0:(⍺-1)∇(↑⌽⍵)({
            ∧/⍵<1e9:⍵ ⋄ (1e9|⍵)+1⌽⍵≥1e9
        }(↑⍵)+↑⌽⍵) ⋄ ↑⌽⍵
    }2⍴⊂(-⌈⍵÷40)↑1
}

Fibonacci←{⎕io ⎕ml←0 1  ⍝ First ⍵ fibonacci numbers.
    s←⎕NS''             ⍝ Class
    s.(f←{⍺←⎕THIS ⋄ ⍺.i<2:⍺.n ⋄ ⊢⍺.n←+/⍺.a[⍺.i-1+⍳2].n}) ⍝ Method
    v←⎕NS¨⍵⍴s           ⍝ Collection
    v.i←⍳⍵               ⍝ Item number
    v.n←⍵↑0 1           ⍝ Initialize
    v.a←⊂v              ⍝ Each knows all
    v.b←(1+⍳⍵)⍴¨⊂v      ⍝ Each knows self and previous?
    v.f 0               ⍝ Compute
}

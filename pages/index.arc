; definitions specific to index.html

(def romannum (n)
  (def ones (mod n 10)) (zap int:/ n 10)
  (def tens (mod n 10)) (zap int:/ n 10)
  (def hund (mod n 10)) (zap int:/ n 10)
  (def thou (mod n 10)) (zap int:/ n 10)
  (cat (romandigit thou "m??")
       (romandigit hund "cdm")
       (romandigit tens "xlc")
       (romandigit ones "ivx")))

(def romandigit (n (o chars "ivx"))
  (let (one five ten) (as!cons chars)
    (case n
      0 (cat)
      1 (cat one)
      2 (cat one one)
      3 (cat one one one)
      4 (cat one five)
      5 (cat five)
      6 (cat five one)
      7 (cat five one one)
      8 (cat five one one one)
      9 (cat one ten)
      (err "Bad digit"))))


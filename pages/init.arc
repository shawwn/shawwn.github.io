; put site-wide arc definitions here

#'(require file/sha1)

(def shash (str)
  (#'sha1 (instring str)))

(defmemo shashfile-1 (filename modtime)
  (w/infile i filename :bytes
    (#'sha1 i)))

(def shashfile (filename)
  (shashfile-1 filename (modtime filename)))

(defhook head name: init ()
  (gentag link rel "stylesheet" href (+ "site.css?" (shashfile "site.css"))) (prn)
  nil)

(def repo-url (url) "https://github.com/shawwn/shawwn.github.io/tree/main/@{url}")


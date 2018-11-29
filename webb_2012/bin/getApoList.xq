declare namespace html = "http://www.w3.org/1999/xhtml";

for $a in //*[@class = "apo"]
  return
  data($a)

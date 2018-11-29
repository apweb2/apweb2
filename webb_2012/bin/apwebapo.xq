declare namespace html = "http://www.w3.org/1999/xhtml";

for $i in //*[@class = "taxon"]
  let $taxon := data($i/@id)
  for $a in $i//*[@class = "apo"]
  return
  concat($taxon , '|', data($a))

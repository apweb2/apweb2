declare namespace html = "http://www.w3.org/1999/xhtml";

for $i in //*[@class = "taxon"]
  let $taxon := data($i/@id)
  return
  concat($taxon , '|', 
         data($i//*[@class = "genn"][1]), '|', 
         data($i//*[@class = "spn"][1]), '|',
         data($i//*[@class = "geo"][1]), '|',
         data($i//*[@class = "rel"][1]), '|',
         data($i//*[@class = "evo"][1]), '|',
         data($i//*[@class = "phylo"][1]), '|',
         data($i//*[@class = "syn"][1]), '|',
		 data($i//*[@class = "morpho"][1]))         

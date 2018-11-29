# Webb’s files, ca. 2012

These files resided on a webserver at the domain `apweb.info`, which I
owned at the time. I have cleaned and reorganized them for easier
examination.

 * Documentation
    * [Data model](doc/datamodel.md).
    * [Data generation process](doc/process.md), from HTML to RDF.
 * Data
    * A [raw list](data/2012-06-29_apos.txt) of parsed apomorphy phrases
 * Database schema
    * The [schema and example data](db/apwebchars.sql) for a DB for
      storing the apomorphy “phrases” and descriptions.
 * Semantic web “stubs”
    * An [OWL ontology](onto/apw.rdf) (made with Protege)
    * Some sample RDF [here](swdata/apweb.rdf) and
      [here](swdata/phenotypes.rdf)
 * Scripts
    * [Here](bin/apw2rdf) and [here](bin/getApoList) for extracting
      data from Peter’s APweb (see documentation). Not rechecked, but
      should give you the gist of what’s going on. Using `curl`, `mysql`,
      [tidy](https://github.com/htacg/tidy-html5/),
      [recode](https://github.com/pinard/Recode),
      [xquilla](http://xqilla.sourceforge.net/homepage) to deal with
      the HTML/XML, and `rapper` (from Redland’s
      [rasqal](http://librdf.org/rasqal/) to handle RDF.
 

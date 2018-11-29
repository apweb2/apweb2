Data processing, from HTML to RDF
=================================

Peter Stevens has maintained APweb for many years as a set of HTML
documents. We debated many ways of converting this information ‘store’
to a new system that could regenerate the HTML pages in a form close
to that which people are familiar with, and could generate the
semantic data of APweb2, but were always stumped by the problem of
how to transition to a new system without having to update data in both
old and new formats during the (probably) lengthy transition time.
Finally, we came up with this process:

 1. Plan to continue using Peter’s HTML as the master data store.
 2. Peter adds minimal markup to the HTML that is invisible to the
    user, but enables automated data extraction:
    * Taxa are enclosed in `<div class="taxon" id="foo">...</div>`
      tags. The taxon ID is a sensible, lowercase string of the form
      `xxxaceae`, or `xxxaceae-yyyaceae` to indicate a taxon defined
      as the MRCA of `xxxaceae` and `yyyaceae`.
    * Text data blocks are enclosed in, e.g., `<div
      class="ecology">...</div>` tags.
    * Text indicating an apomorphy is tagged with `<b class="apo">text
      here</b>`. For each apomorphy we maintain a list of text phrases
      used to refer to it, i.e., a ‘synonymy’ list for the apomorphy.
      The apomorphy also has a label, and where it is more convenient,
      Peter can identify the presence of an apomorphy using just the
      label: `<b class="apo" char="LeavesOposite">text here</b>` (multiple
      apomorphies can be specified as
      `char="LeavesOposite|ExudateAbsent"`). The presence of
      `char="..."` over-rides the parsing of text between `<b>` and `</b>`.
 3. On a daily basis, all HTML pages are copied to the new server and
    processed to extract the atomic information.
 4. They are first passed through
    [`html tidy`](http://tidy.sourceforge.net/) to confirm that we are
    working on valid XML. Note that the non-standard, proprietary
    attribute `char` is preserved by default in `html tidy`.
 5. An XQuery script extracts all structured data for a taxon within
    each webpage. 
 6. The synapomorphy text strings are looked up in a database of
    characters that Peter develops and so synapomorphies are assigned
    to each taxon.
 7. An RDF document is then generated for all the taxon-specific data
    and for the current list of phenotypes, with all resources hosted
    at: http://apweb.info/sw .
 8. The RDF document is loaded into the project triplestore.
 9. Requests for RDF at the resource URIs are filled by SPARQL queries to
    the triplestore.
 10. A separate flat-table DB is maintained that fulfills requests to
    the RESTful API, which are return as plain text.
 

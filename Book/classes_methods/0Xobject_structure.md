

# Problem
 Remember that `slot(sp.object, 'bbox')` and `sp.object@bbox` are valid methos to access the `bbox`. The same is thrue for other slots (i.e. `proj4string`).  
`str` and `summary` are conveninet functions to inspect the structure of `Spatial` objects. Controling the maximal level of nesting displayed by the `str` is a useful option specially for objects with slots that have many levels of nesting or objects with many elemnts. Compare the result of  `str(sp.object, 2)` and `str(sp.object)`.  


In addition to `@` and `slot`, the `coordinates` function can be used to access the `coords` slot.


menor :: Ord a => [a] -> a
menor [x] = x
menor (primero:segundo:resto) =
    if(primero < segundo) then menor (primero:resto)
    else menor (segundo:resto)

mayor [x] = x
mayor (primero:segundo:resto) =
    if (primero > segundo) then menor(primero:resto)
    else mayor (segundo:resto)
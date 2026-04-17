
menor :: Ord a => [a] -> a
menor [x] = x
menor (primero:segundo:resto) =
    if(primero < segundo) then menor (primero:resto)
    else menor (segundo:resto)
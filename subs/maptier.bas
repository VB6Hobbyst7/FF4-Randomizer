function MapTier(map_index as Integer) as UByte

 dim result as UByte
 
 select case map_index + 1
  case 1, 3, 12 to 15, 17 to 19, 34, 37, 38, 43 to 58, 64 to 68, 109 to 132, 208, 210 to 213, 228, 229, 237
   result = 1
  case 4, 20 to 24, 39, 59 to 63, 69, 72 to 83, 230 to 236
   result = 2
  case 2, 5 to 11, 16, 25 to 33, 40, 41, 70, 71, 86 to 102, 133 to 163, 225 to 227
   result = 3
  case 264 to 297
   result = 4
  case 167 to 173, 200 to 207, 257 to 263, 307 to 346
   result = 5
  case 182 to 190, 347 to 381
   result = 6
  case else
   result = 0
 end select
 
 return result

end function

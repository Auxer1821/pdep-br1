type Produco = (String,Float)
nombreDelProducto :: Produco -> String
nombreDelProducto producto = fst producto


precioTotal::(Num a)=>a->a->a->a->a
precioTotal precioUnitario cantidadProducto descuento costoDeEnvio = aplicarDescuento precioUnitario descuento * cantidadProducto + aplicarCostoDeEnvio precioUnitario costoDeEnvio 

productoDeElite:: Produco -> Bool
productoDeElite unProducto = (productoDeLujo.nombreDelProducto) unProducto && (productoCodiciado.nombreDelProducto) unProducto && (not.productoCorriente.nombreDelProducto) unProducto

aplicarDescuento:: (Num a)=> a->a->a
aplicarDescuento precioProducto descuento = precioProducto - descuento

type Entrega = (String,[CantidaXPructo],Float)
type CantidaXPructo = (Int,Produco)
diaDeEntega :: Entrega -> String
diaDeEntega (dia,_,_) = dia


entregaSencilla:: Entrega -> Bool 
entregaSencilla entrega = diaSencillos.diaDeEntega$entrega

diaSencillos:: String -> Bool
diaSencillos dia = even.length$dia

descodiciarProducto:: String->String
descodiciarProducto nombreProducto = take 10 nombreProducto

productoDeLujo:: String->Bool
productoDeLujo nombreProducto = elem 'x' nombreProducto || elem 'z' nombreProducto

aplicarCostoDeEnvio:: (Num a)=> a->a->a
aplicarCostoDeEnvio precioProducto envio = precioProducto + envio 

productoCodiciado:: String->Bool
productoCodiciado nombreProducto =(>10).length$nombreProducto

productoCorriente:: String->Bool
productoCorriente nombreProducto = esVocal.head$nombreProducto

esVocal :: Char -> Bool
esVocal caracter = elem caracter "aeiouAEIOU"

productoXL:: Produco -> Produco
productoXL (nombreProducto,costoProducto) = (nombreProducto++"XL",costoProducto)

versionBarata:: String -> String
versionBarata nombreProducto = reverse.descodiciarProducto$nombreProducto

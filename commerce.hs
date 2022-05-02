type NombreDleProducto = String
type PrecioDleProducto = Float

type Producto = (NombreDleProducto,PrecioDleProducto)
nombreDelProducto :: Producto -> String
nombreDelProducto producto = fst producto

--Quise poner (Num a,b,c,d) pero no me funcionaba 
precioTotal::(Num a)=>a->a->a->a->a
precioTotal precioUnitario cantidadProducto descuento costoDeEnvio = aplicarDescuento precioUnitario descuento * cantidadProducto + aplicarCostoDeEnvio precioUnitario costoDeEnvio 

productoDeElite:: Producto -> Bool
productoDeElite unProducto = (productoDeLujo.nombreDelProducto) unProducto && (productoCodiciado.nombreDelProducto) unProducto && (not.productoCorriente.nombreDelProducto) unProducto

aplicarDescuento:: (Num a)=> a->a->a
aplicarDescuento precioProducto descuento = precioProducto - descuento

type DiaEntrega = String
type PreciEntrega = Float

type Entrega = (DiaEntrega,[CantidaXPructo],PreciEntrega)
type CantidaXPructo = (Int,Producto)
diaDeEntega :: Entrega -> String
diaDeEntega (dia,_,_) = dia


entregaSencilla:: Entrega -> Bool 
entregaSencilla entrega = diaSencillos.diaDeEntega$entrega

diaSencillos:: DiaEntrega -> Bool
diaSencillos dia = even.length$dia

descodiciarProducto:: NombreDleProducto->NombreDleProducto
descodiciarProducto nombreProducto = take 10 nombreProducto

productoDeLujo:: NombreDleProducto->Bool
productoDeLujo nombreProducto = elem 'x' nombreProducto || elem 'z' nombreProducto

aplicarCostoDeEnvio:: (Num a)=> a->a->a
aplicarCostoDeEnvio precioProducto envio = precioProducto + envio 

productoCodiciado:: NombreDleProducto->Bool
productoCodiciado nombreProducto =(>10).length$nombreProducto

productoCorriente:: NombreDleProducto->Bool
productoCorriente nombreProducto = esVocal.head$nombreProducto

esVocal :: Char -> Bool
esVocal caracter = elem caracter "aeiouAEIOU"

productoXL:: Producto -> Producto
productoXL (nombreProducto,costoProducto) = (nombreProducto++"XL",costoProducto)

versionBarata:: NombreDleProducto -> NombreDleProducto
versionBarata nombreProducto = reverse.descodiciarProducto$nombreProducto 


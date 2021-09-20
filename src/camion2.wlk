import cosas2.*


object camion {
	const property cosas = []
	const tara = 1000
	
	method peso(){return tara}
	method cosas(){return cosas}
	method cargar(unaCosa) {cosas.add(unaCosa) unaCosa.consecuenciasDeCarga()}
	method descargar(cosa){cosas.remove(cosa)}
	
	method todoPesoPar(){
		/*si el peso de cada uno de los objetos 
		cargados es un número par.*/
		return
			cosas.all({cosa => cosa.peso().even()}) 
		
	}
	
	method hayAlgunoQuePesa(unPeso) {
		return
		cosas.any({cosa => cosa.peso() == unPeso})
	}
	
	method elDeNivel(nivel) {
		return
		cosas.find({peligro => peligro.nivelPeligrosidad() == nivel})
	}
	
	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso()})
	}
	
	method excedidoDePeso() {return self.pesoTotal() > 2500}
	
	method objetosQueSuperanPeligrosidad(nivel) {
		/*devuelve una colección con los objetos cargados que superan 
		el nivel de peligrosidad indicado.*/
		return
			cosas.filter({cosa =>cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(elemento) {
		/*devuelve una colección con los objetos cargados que son 
		 más peligrosos que la cosa indicada.*/
		 cosas.filter({cosa => cosa.nivelPeligrosidad() > elemento.nivelPeligrosidad()})
		 
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		/* Puede circular si no está excedido de peso, 
		 y además, ninguno de los objetos cargados
		 supera el nivel máximo de peligrosidad indicado.*/
		 return 
		 	not self.excedidoDePeso() and
		 	self.cosas().max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() > nivelMaximoPeligrosidad
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		/*indica si el peso de alguna de las cosas que 	
		tiene el camión está en ese intervalo.*/
		return cosas.any({cosa => cosa.peso().between(min,max)})
	} 
	
	method cosaMasPesada(){ //hacer
		/*la cosa más pesada que tenga el camión. 
		Ojo que lo que se pide es la cosa y no su peso.*/
		return cosas.max({cosa => cosa.peso()})
		
	} 
	
	method pesos(){
		/*devuelve una lista con los pesos de 
		cada cosa que tiene el camión.*/
		return cosas.map({cosa => cosa.peso()})
	}
	
	method totalBultos(){
		var cantidadDeBultos = 0 
		/*totalBultos(): la suma de la cantidad de bultos que está transportando. KnightRider,
		 arena a granel y residuos radioactivos son 1 bulto. Bumblebee y embalaje de seguridad son dos. 
		 Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más.
		 Batería antiaérea: 1 si no tiene misiles, 2 si tiene. Contenedor portuario: 1 + los bultos que tiene adentro.*/
		  if (self.bulto1()) {cantidadDeBultos += 1}
		  if (self.bulto2()) {cantidadDeBultos += 2}
		  if (cosas.contains(contenedorPortuario)) {cantidadDeBultos += contenedorPortuario.bultos()}
		  if (cosas.contains(bateriaAntiaerea)) {cantidadDeBultos += bateriaAntiaerea.bultos()}
		  if (cosas.contains(paqueteDeLadrillos)) {cantidadDeBultos += paqueteDeLadrillos.bultos()}
		  
		 return cantidadDeBultos  
		 
	}
	
	method bulto1 (){
		return cosas.contains(knightRider) and cosas.contains(arenaAGranel) and cosas.contains(residuosRadioactivos)
	}
	
	method bulto2(){
		return cosas.contains(bumblebee) and cosas.contains(embalajeDeSeguridad)
	}
}
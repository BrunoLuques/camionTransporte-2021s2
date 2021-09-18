import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
	
	method peso(){return tara}
	method cosas(){return cosas}
	method cargar(unaCosa) {cosas.add(unaCosa)}
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
		 	cosas.count({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad}) == 0
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		/*indica si el peso de alguna de las cosas que 
		tiene el camión está en ese intervalo.*/
		
	} 
	
	method cosaMasPesada(){ //hacer
		/*la cosa más pesada que tenga el camión. 
		Ojo que lo que se pide es la cosa y no su peso.*/
		
	} 
	
	method pesos(){
		/*devuelve una lista con los pesos de 
		cada cosa que tiene el camión.*/
		
	}
}

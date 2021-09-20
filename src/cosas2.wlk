import camion2.*

object knightRider {
	method peso() {return 500}
	method nivelPeligrosidad() {return 10}
	
	method consecuenciasDeCarga(){
		
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() {return 800}
	method nivelPeligrosidad() {return if (transformadoEnAuto) {15} else {30}}
	method transformar() {transformadoEnAuto = false}
	method transformadoEnAuto(){ return transformadoEnAuto} // se realiza el metodo para testear
	
	method consecuenciasDeCarga(){
		self.transformar()
	}
}

object paqueteDeLadrillos {
	var cantidad = 0
	//Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o má
	method asignarCantidad(cuantos){cantidad = cuantos}
	method peso() {return 2 * cantidad}
	method nivelPeligrosidad() {return 2}
	method cantidad() { return cantidad}  // se realiza el metodo para testear
	method bultos(){
		return if (cantidad.between(1,100)) {1} else if (cantidad.between(101,300)) {2} else if (cantidad >= 301) {3} else {0}
	}
	
	method consecuenciasDeCarga(){
		cantidad += 12
	}
}

object arenaAGranel {
	var peso = 0
	
	method asignarPeso(nuevoPeso){peso = nuevoPeso}
	method peso() {return peso}
	method nivelPeligrosidad() {return 1}
	
	method consecuenciasDeCarga(){
		peso += 20
	}
}

object bateriaAntiaerea {
	var estaConMisiles = false
	// Batería antiaérea: 1 si no tiene misiles, 2 si tiene
	method peso(){
		return if (estaConMisiles) 300 else 200
	}
	
	method cargarMisiles(){estaConMisiles = not estaConMisiles}
	method estaConMisiles() { return estaConMisiles}  
	method nivelPeligrosidad() {
		return 
			if (estaConMisiles) 100 else 0
	}
	
	method bultos(){
		return if (not estaConMisiles) {1} else {2}
	}
	
	method consecuenciasDeCarga(){
		self.cargarMisiles()
	}
}

object contenedorPortuario{
	/*un contenedor puede tener otras cosas adentro. 
	El peso es 100 + la suma de todas las cosas que estén adentro. 
	Es tan peligroso como el objeto más peligroso que contiene. 
	Si está vacío, su peligrosidad es 0.*/
	var peso = 100
	var nivelPeligrosidad = 0
	var property cosas = []
	
	method cosas(){return cosas}
	method peso(){return peso}
	method nivelPeligrosidad(){return nivelPeligrosidad}
	method cargar(cosa){
		cosas.add(cosa)
		peso += cosa.peso()
		nivelPeligrosidad =	cosas.max({elemento => elemento.nivelPeligrosidad()}).nivelPeligrosidad()
		
	}
	
	method descargar(cosa){cosas.remove(cosa)}
	
	method bultos(){
		var resultado = 0 
		if (self.bulto1 ()) {resultado += 1}
		if (self.bulto2()) {resultado += 2}
		if (cosas.contains(bateriaAntiaerea)) {resultado += bateriaAntiaerea.bultos()}
		if (cosas.contains(paqueteDeLadrillos)) {resultado += paqueteDeLadrillos.bultos()}
		resultado += 1 
		
		return resultado 
	}
	
	method consecuenciasDeCarga(){
		cosas.forEach({ cosa => cosa.consecuenciasDeCarga() })
	}
	
	method bulto1 (){
		return cosas.contains(knightRider) and cosas.contains(arenaAGranel) and cosas.contains(residuosRadioactivos)
	}
	
	method bulto2(){
		return cosas.contains(bumblebee) and cosas.contains(embalajeDeSeguridad)
	}
} 

object residuosRadioactivos{
	var peso = 0
	
	method asignarPeso(pesoNuevo){ peso = pesoNuevo}
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
	
	method consecuenciasDeCarga(){
		peso += 15
	}
}

object embalajeDeSeguridad{
	/*Es una cobertura que envuelve a cualquier otra cosa. 
	El peso es el peso de la cosa que tenga adentro. 
	El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.*/
	var cosaEnvuelta = residuosRadioactivos 
	
	method envolverCosa(cosaAEnvolver){ cosaEnvuelta = cosaAEnvolver}
	method peso(){ return cosaEnvuelta.peso()}
	method nivelPeligrosidad() { return (cosaEnvuelta.nivelPeligrosidad())/2}
	
	method consecuenciasDeCarga(){
		
	}
}
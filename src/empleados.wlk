/*Gimenez y baigorria tienen ambos el metodo cobrarSueldo y lo
 * necesario para ver y modificar su dinero, todo lo que Galvan
 * puede necesitar hacer con ellos, por lo que el uso de ambos 
 * empleados en el codigo de Galvar es polimorfico.*/ 

object gimenez {

	var property sueldo = 15000
	var dinero = 0
	method totalCobrado(){ return dinero}
	method cobrarSueldo(){ dinero += sueldo}
}

object baigorria {
	var cantidadEmpanadasVendidas = 100
	var montoPorEmpanada = 15
	var deuda = 0
	var property dinero = 0
	
	method venderEmpanada() {
		cantidadEmpanadasVendidas += 1
	}
 	
	method sueldo(){ return (cantidadEmpanadasVendidas * montoPorEmpanada) }
	method cobrarSueldo(){ 
		if (deuda==0){
			dinero = dinero + self.sueldo()
		}
		else if (self.sueldo()>deuda){
			dinero = self.sueldo() - deuda
			deuda = 0
		}
		else{
			deuda -= self.sueldo()
		}
	}
	method gastar(cuanto){ 
		if (cuanto<=dinero){
			dinero -= cuanto
		}
		else{
			deuda = cuanto - dinero
			dinero = 0
		}
	}
	method totalDeuda(){ return deuda }
	method totalDinero(){ return dinero }
}

object galvan {
	var dinero = 300000
	method dinero() { return dinero }
	method pagarA(empleado) { 
		dinero -= empleado.sueldo() 
		empleado.cobrarSueldo()
	}
}

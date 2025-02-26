import os
os.system('clear')

class Empleado:
    def __init__(self, nombre, salario_base, horas_extra, tasa_extra):
        self.nombre = nombre
        self.salario_base = salario_base
        self.horas_extra = horas_extra
        self.tasa_extra = tasa_extra

def calcular_nomina(empleado):
    # Cálculo de horas extra
    pago_extra = empleado.horas_extra * empleado.tasa_extra
    
    # Cálculo de deducciones (ejemplo: 9.5% para seguro social)
    deducciones = empleado.salario_base * 0.095
    
    # Cálculo de salario total
    salario_total = empleado.salario_base + pago_extra - deducciones
    
    return salario_total, deducciones, pago_extra

def main():
    # Entrada de datos del empleado
    nombre = input("Ingrese el nombre del empleado: ")
    salario_base = float(input("Ingrese el salario base: "))
    horas_extra = float(input("Ingrese las horas extra trabajadas: "))
    tasa_extra = float(input("Ingrese la tasa por hora extra: "))

    # Crear objeto empleado
    empleado = Empleado(nombre, salario_base, horas_extra, tasa_extra)

    # Calcular nómina
    salario_total, deducciones, pago_extra = calcular_nomina(empleado)

    # Mostrar resultados
    print("\n=== Boleta de Pago ===")
    print(f"Empleado: {empleado.nombre}")
    print(f"Salario Base: ${empleado.salario_base:.2f}")
    print(f"Pago por Horas Extra: ${pago_extra:.2f}")
    print(f"Deducciones: ${deducciones:.2f}")
    print(f"Salario Total: ${salario_total:.2f}")

if __name__ == "__main__":
    main()
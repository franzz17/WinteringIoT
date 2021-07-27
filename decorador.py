def mayor(func):
    def _mayor(nom,ed):
        func(nom,ed)
        if ed < 18:
            print(f"{nom} eres menor de edad ({ed})")
        else:
            print(f"{nom} eres mayor de edad ({ed})")
    return _mayor

@mayor
def persona(nom,ed):
    print(f"Te llamas {nom} y tienes {ed} años")

nombre = str(input("Ingresa tu nombre: "))
edad = int(input("Ingresa tu edad: "))

persona(nombre,edad)
def dividir(a, b):
    try:
        return "La división de {} y {} es {}".format(a, b, a / b)
    except ZeroDivisionError:
        return 'No se puede dividir por cero'
def main():
    print(dividir(10, 2))
    print(dividir(10, 0))
main()
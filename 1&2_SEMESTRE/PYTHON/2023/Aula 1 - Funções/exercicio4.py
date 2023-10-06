#uma função que receba uma data no formato DD/MM/AAAA e devolva uma string no formato D de mesPorExtenso de AAAA.

def data_por_extenso(data):
    dia, mes, ano = data.split("/")

    meses = {
        "01": "janeiro",
        "02": "fevereiro",
        "03": "março",
        "04": "abril",
        "05": "maio",
        "06": "junho",
        "07": "julho",
        "08": "agosto",
        "09": "setembro",
        "10": "outubro",
        "11": "novembro",
        "12": "dezembro"
    }

    mes = meses[mes]
    data_extenso = f"{dia} de {mes} de {ano}"

    return data_extenso

data = input("Digite uma data no formato DD/MM/AAAA: ")
data_extenso = data_por_extenso(data)
print(data_extenso)
resp = 1
product = {}

while (resp != 0):
    print('Welcome to the system! Please, choose an option below:')
    print('1 - Create')
    print('2 - Read')
    print('3 - Update')
    print('4 - Delete')
    try:
        opc = int(input("Select the option wanted (1-4): "))
    except ValueError:
        print('Insert a number!')
    else:
        if (opc == 1):
            try:
                cod = int(input('Create the code number to this product: '))
                if (cod in product):
                    print("Product code already exists!")
                else:
                    desc = input('Insert the description of this product: ')
                    try:
                        qtde = int(input('Insert the quantity of this product: '))
                    except ValueError:
                        print('Insert a number!')
                    try:
                        valor = float(input('Insert the value of this product: '))
                    except ValueError:
                        print('Insert a number!')

                    product[cod] = {'cod':cod,'descricao':desc,'qtde':qtde,'valor':valor}
            finally:
                print('Operation completed, product inserted into our database!')
        elif (opc == 2):
            print(product)
        elif (opc == 3):
            try:
                cod = int(input('Insert the code of the product you want to update the information: '))
            except ValueError:
                print('Insert a valid number of the product!')
            else:
                if (cod in product):
                    product[cod]['descricao'] = input("Insert the new description of this product: ")
                    try:
                        product[cod]['qtde'] = int(input("Insert the new qtde of this product: "))
                    except ValueError:
                        print('Insert a valid number')
                    try:
                        product[cod]['valor'] = float(input("Insert the new value of this product: "))
                    except ValueError:
                        print('Insert a valid number')
                else:
                    print("Product not found/does not exists")
            finally:
                print('Operation completed, information of the product was updated into our database!')
        elif (opc == 4):
            try:
                cod = int(input("Insert the code of the product you want to delete: "))
            except ValueError:
                print('Insert a number!')
            else:
                if (cod in product):
                    del product[cod]
                else:
                    print("Product code not found!")

    resp = int(input("Do you wish to continue (1-YES/0-NO)?: "))
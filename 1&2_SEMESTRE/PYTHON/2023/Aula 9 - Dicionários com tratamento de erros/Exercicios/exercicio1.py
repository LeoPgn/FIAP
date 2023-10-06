resp = 1
users = {}

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
                cod = int(input('Create the code number to this user: '))
            except ValueError:
                print('Insert a number!')
            else:
                if (cod in users):
                    print("User already exists!")
                else:
                    try:
                        name = input('Insert the name of this user: ')
                        age = int(input('Insert the age of this user: '))
                        salary = float(input('Insert the salary of this user: '))
                    except ValueError:
                        print('Insert a number!')
                    else:
                        users[cod] = {'cod':cod,'name':name,'age':age,'salary':salary}
                    finally:
                        print('The operation is closed!')
        elif (opc == 2):
            print(users)
        elif (opc == 3):
            try:
                cod = int(input('Insert the code of the user you want to update the information: '))
            except ValueError:
                print('Insert a valid number of the user!')
            else:
                if (cod in users):
                    try:
                        users[cod]['name'] = input("Insert the new name of this user: ")
                        users[cod]['age'] = int(input("Insert the new age of this user: "))
                        users[cod]['salary'] = float(input("Insert the new salary of this user: "))
                    except ValueError:
                        print('Insert a valid number for age of the user!')
                else:
                    print("User not found/does not exists")
            finally:
                print('The operation is closed!')
        elif (opc == 4):
            try:
                cod = int(input("Insert the code of the user you want to delete: "))
            except ValueError:
                print('Insert a number!')
            else:
                if (cod in users):
                    del users[cod]
                else:
                    print("User code not found!")
            finally:
                print('The user was successfully deleted from the database!')

        resp = int(input("Do you wish to continue (1-YES/0-NO)?: "))
        if (resp == 0):
            print("Operation closed!")

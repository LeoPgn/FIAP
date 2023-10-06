
print("Hello")

    x = [1,2,3,4,5,6,7,8,9,9,0,-1,2,3,4,5,6,3,23,5,6,4635]


# In[3]:


x.len


# In[4]:


len(x)
x.sort()
print(x)


def media_aritmetica(x):
    media = sum(x)/22
    return x

print(media_aritmetica(x))

x = [1,2,3,4,5,6,7,8,9,10]

#metodo de utilizar a lista e somar ela inteira
def media_aritmetica(x):
    tamanho = len(x)
    acumulador = 0
    for i in range(0, 10):
        acumulador += x[i]
    print(acumulador)
    media = acumulador/len(x)
    return media

print(media_aritmetica(x))






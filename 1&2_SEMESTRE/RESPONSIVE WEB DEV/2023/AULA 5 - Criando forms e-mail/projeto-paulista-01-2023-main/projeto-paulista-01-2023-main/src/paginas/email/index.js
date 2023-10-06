import React, {useState} from 'react'
import {ContainerPage, TittlePage} from '../../../src/components/main'


function Email() {
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [message, setMessage] = useState('');
    
    function sendEmail(){

        if(name ==='' || email === '' || message ===''){
            alert('Preencha os campos do form')
            return; //Se eu coloco o return, ele diz para parar neste bloco de código e NÃO continuar executando o código seguinte
        }
        alert('Teste')
    }
  return (
    <>
    <ContainerPage>
        <TittlePage>
            <h1>Página e-mail</h1>
        </TittlePage>
        <form className='form' onSubmit={sendEmail}>
            <input className='input' type='text' placeholder='Digite seu nome' 
            onChange={(e) => setName(e.target.value)} value={name} />

            <input className='input' type='text' placeholder='Digite seu e-mail' 
            onChange={(e) => setEmail(e.target.value)} value={email}/>

            <input className='input' type='textarea' placeholder='Digite sua mensagem' 
            onChange={(e) => setMessage(e.target.value)} value={message}/>
            <input className='buttom' type='submit' value='Enviar'/>
        </form>
    </ContainerPage>
    
    
    </>
  )
}

export default Email
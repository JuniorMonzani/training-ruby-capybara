describe 'Login2', :login2 do
  before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/login2'
    sleep 1
  end
  
  it 'Com data de nascimento' do    
    find('#userId').set 'stark'
    find('#passId').set 'jarvis!'
    #busca pelo atributo pai 'login' e guarda em variável
    login_form = find('#login')
    
    #usa a variável com atributo pai para encontrar os campo dinâmico na tela
    case login_form.text
    when /Dia/
      find('#day').set '29'
    when /Mês/
      find('#month').set '05'
    when /Ano/
      find('#year').set '1970'
    end

    click_button 'Login'
    expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end
    
    after(:each) do
      sleep 1
    end
  end

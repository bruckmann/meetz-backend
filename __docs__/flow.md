## A intenção deste documento é demonstrar qual vai ser o flow do usuário, deste sua chegada até o aluguel de uma sala.
- O primeiro passo caso o usuário não possua uma aconta, será se cadastar
  - Para se cadastrar ele ira precisar preencher os seguintes campos:
    - Email (O email precisa ser corporativo);
    - Nome completo;
    - Senha (no momento não existe nenhuma restrição de senha)
  - Após isso, a conta dele sera devidamente cadastrada, e seu tipo inicial será com o Role de usuário comum.
- Caso o usuário já possua uma conta, ele irá precisar fazer o login preenchendo os seguintes campos:
  - Email
  - Senha
- Se ele preencher corretamente os campos acima, a aplicação ira levalo para a tela inicial, caso ele preencha incorretamente qualquer informação a aplicação ira devolver uma mensagem de usuário ou senha inválidos.
- Uma vez que o usuário fez seu login na aplicação e for levado para a tela inicial, ira poder ver seus próximos 3 agendamentos, caso tenha. Também ira aparecer duas opções, são elas:
  - Consultar agendamentos:
    - Nessa opção, o usuário podera consultar um agendamento pelo código de agendamento, que é fornecido quando você agenda uma sala.
  - Consultar salas disponiveis:
    - Nessa opção, o usuário podera consultar quais são as salas disponiveis em um devido horário, por exemplo, quero saber as salas que estão disponiveis na data de 20/10/2021, isso ira trazer todas as salas disponivéis nessa data. Caso o usuário se interesse por alguma, ele podera prosseguir com o agendamento.
    - Quando você for consultar salas disponivéis, algumas informações sobre as salas serão mostradas, como por exemplo:
      - Se a sala possui ou não ar condicionado;
      - Se sala possui ou não quadro branco;
      - Se a sala possui ou não DataShow;
      - Qual o limite máximo de pessoas permitidas dentro daquela sala;
      - Quantos metros quadrados possui a sala.
- Apartir disso, o usuário também poderá fazer um agendamento, as informações do agendamento são basicamente:
 - Data e horário do agendamento;
 - Se o usuário tem alguma nota para deixar, como por exemplo: Por favor, deixe o ar condicionado na temperatura de 20 graus para ir climatizando o ambiênte;
 - E qual será a sala do agendamento.
:- [mensagens].

adicionarElemento([], X, [X]).
adicionarElemento([L|R], X, [L|R1]):- adicionarElemento(R, X, R1).

receberNumero(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

receberString(String):- read_line_to_string(user_input, String).

entrada_pegarOpcaoMenu(Opcao):- mensagem_menuPrincipal, imprimePrompt, receberNumero(Opcao).

entrada_receberNomeSobrenomeJogadores(NumParticipantes,_, NomeSobrenomeJogadoresFinal):-
    NumParticipantes =:= 0,
    NomeSobrenomeJogadoresFinal = NomeSobrenomeJogadoresFinal.

entrada_receberNomeSobrenomeJogadores(NumParticipantes, NomeSobrenomeJogadores,NomeSobrenomeJogadoresFinal):-
    write("Digite seu nome e sobrenome: "),
    receberString(NomeSobrenome),
    adicionarElemento(NomeSobrenomeJogadores, NomeSobrenome, NomeSobrenomeJogadoresFinal),
    entrada_receberNomeSobrenomeJogadores(NumParticipantes - 1,  NomeSobrenomeJogadores, NomeSobrenomeJogadoresFinal).

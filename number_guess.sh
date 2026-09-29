#!/bin/bash

# Acesso ao PSQL
PSQL="psql --username=freecodecamp --dbname=random_number_game -t --no-align -c"

# Usuário
echo "Enter your username:"
read USUARIO

# Procurar usuário
USUARIO_ID=$($PSQL "SELECT username_id FROM users WHERE username='$USUARIO';")

# Usuário novo
if [[ -z $USUARIO_ID ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USUARIO');")
  USUARIO_ID=$($PSQL "SELECT username_id FROM users WHERE username='$USUARIO';")
  INSERT_STATS=$($PSQL "INSERT INTO stats(username_id, games_played, best_game) VALUES($USUARIO_ID, 0, NULL);")

  GAMES_PLAYED=0
  BEST_GAME=""

  echo "Welcome, $USUARIO! It looks like this is your first time here."

# Usuário existente
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM stats WHERE username_id=$USUARIO_ID;")
  BEST_GAME=$($PSQL "SELECT best_game FROM stats WHERE username_id=$USUARIO_ID;")

  echo "Welcome back, $USUARIO! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Número secreto
NUMERO=$((1 + RANDOM % 1000))
NUMERO_CHUTES=0

echo "Guess the secret number between 1 and 1000:"

# Jogo: todo input conta como tentativa
while true
do
  read CHUTE
  NUMERO_CHUTES=$((NUMERO_CHUTES + 1))

  if ! [[ $CHUTE =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $CHUTE -gt $NUMERO ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $CHUTE -lt $NUMERO ]]
  then
    echo "It's higher than that, guess again:"
  else
    break
  fi
done

# Atualizar estatísticas
GAMES_PLAYED=$((GAMES_PLAYED + 1))

if [[ -z $BEST_GAME || $NUMERO_CHUTES -lt $BEST_GAME ]]
then
  BEST_GAME=$NUMERO_CHUTES
fi

UPDATE_STATS=$($PSQL "UPDATE stats SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username_id=$USUARIO_ID;")

# Resultado
echo "You guessed it in $NUMERO_CHUTES tries. The secret number was $NUMERO. Nice job!"
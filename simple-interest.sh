#!/bin/bash

# simple-interest.sh
# Calculadora de interés simple: I = P * R * T

echo "=== Calculadora de Interés Simple ==="

# Función para validar número (entero o decimal)
is_number() {
  [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]
}

# Leer Capital
read -p "Ingresa el capital (P): " P
while ! is_number "$P"; do
  echo "Entrada inválida. Ingresa un número válido."
  read -p "Ingresa el capital (P): " P
done

# Leer Tasa de interés (%)
read -p "Ingresa la tasa de interés anual en % (R): " R
while ! is_number "$R"; do
  echo "Entrada inválida. Ingresa un número válido."
  read -p "Ingresa la tasa de interés anual en % (R): " R
done

# Convertir porcentaje a decimal
R=$(echo "scale=6; $R / 100" | bc)

# Leer Tiempo (años)
read -p "Ingresa el tiempo en años (T): " T
while ! is_number "$T"; do
  echo "Entrada inválida. Ingresa un número válido."
  read -p "Ingresa el tiempo en años (T): " T
done

# Calcular interés simple
I=$(echo "scale=2; $P * $R * $T" | bc)

# Calcular monto total
TOTAL=$(echo "scale=2; $P + $I" | bc)

echo "-----------------------------------"
echo "Interés generado: $I"
echo "Monto total: $TOTAL"
echo "-----------------------------------"

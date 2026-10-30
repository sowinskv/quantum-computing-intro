#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "************************************************************"
echo "* Inicjalizacja środowiska programistycznego – zajęcia WOK *"
echo "************************************************************"
echo

if [ ! -f requirements.txt ]; then
    cat > requirements.txt <<'EOF'
jupyterlab
numpy
qiskit[visualization]
matplotlib
qiskit-aer
pylatexenc
sympy
EOF
fi

printf "Tworzenie środowiska wirtualnego (to może chwilę potrwać)... "
if [ ! -d wokenv ]; then
    python3 -m venv wokenv
fi
echo "[OK]"

source wokenv/bin/activate

printf "Instalowanie pakietów z pliku wymagań (to może zająć dłuższą chwilę)... "
pip install -q -r requirements.txt
echo "[OK]"

echo
echo "Gotowe! Wszystko zainstalowane pomyślnie."
echo "Uruchamianie JupyterLab..."
echo

python -m jupyterlab

#!/bin/bash
# Chemin vers le volume A
VOLUME_PATH="/A/bank_data"

# Nombre de fichiers à générer
NUM_FILES=5

# Nombre de lignes par fichier
LINES_PER_FILE=10

# Générer des fichiers de données de test
for i in $(seq 1 $NUM_FILES); do
    FILE_NAME="$VOLUME_PATH/transactions_$i.txt"
    echo "Generating $FILE_NAME ..."

    # Créer ou vider le fichier avant d'écrire
    hadoop fs -touchz $FILE_NAME

    for j in $(seq 1 $LINES_PER_FILE); do
        # Générer des données fictives de transaction
        ACCOUNT_ID=$((RANDOM % 1000 + 1))
        TRANSACTION_AMOUNT=$(awk -v min=10 -v max=1000 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
        TRANSACTION_TYPE=$(shuf -n 1 -e "Deposit" "Withdrawal" "Transfer")
        DATE=$(date +%Y-%m-%d)

        # Ajouter la ligne de transaction dans le fichier local
        echo "$DATE,AccountID:$ACCOUNT_ID,Amount:$TRANSACTION_AMOUNT,Type:$TRANSACTION_TYPE" >> /tmp/transactions_$i.txt
    done

    # Copier le fichier local vers HDFS
    hadoop fs -put /tmp/transactions_$i.txt $FILE_NAME
done

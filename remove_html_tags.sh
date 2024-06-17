#!/bin/bash

# Répertoires source et destination
source_dir="./"
dest_dir="processed"

# Crée le répertoire de destination s'il n'existe pas
mkdir -p "$dest_dir"

# Parcours tous les fichiers .md du répertoire source
for file in "$source_dir"/*.md; do
    # Vérifie si le fichier existe pour éviter les erreurs lorsque aucun fichier .md n'est trouvé
    if [ -e "$file" ]; then
        # Obtient le nom de fichier sans le chemin
        filename=$(basename "$file")
        
        # Supprime toutes les balises HTML tout en conservant le contenu à l'intérieur
        sed 's/<[^>]*>//g' "$file" > "$dest_dir/$filename"
    fi
done

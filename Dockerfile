# Utiliser l'image de base python:3.6-alpine
FROM python:3.6-alpine

# Définir le répertoire de travail
WORKDIR /opt

# Installer Flask version 1.1.2
RUN pip install flask==1.1.2

# Exposer le port 8080
EXPOSE 8080

# Créer des variables d'environnement par défaut pour ODOO_URL et PGADMIN_URL
# Ces valeurs peuvent être redéfinies lors du lancement du conteneur
ENV ODOO_URL="https://www.odoo.com/"
ENV PGADMIN_URL="https://www.pgadmin.com/"

# Copier l'application app.py dans le conteneur
COPY app.py /opt/

# Copier les répertoires templates et static dans le conteneur
COPY templates /opt/templates
COPY static /opt/static

# Définir le point d'entrée pour lancer l'application Flask
ENTRYPOINT ["python"]
CMD [ "app.py" ]


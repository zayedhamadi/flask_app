# Utiliser une image de base Ubuntu
FROM ubuntu:20.04

# Mettre à jour les paquets et installer Python, pip, et venv
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean

# Créer un environnement virtuel et activer
RUN python3 -m venv /opt/venv

# Installer Flask dans l'environnement virtuel
RUN /opt/venv/bin/pip install flask

# Copier le fichier app.py dans le conteneur
COPY app.py /opt/app.py

# Définir la variable d'environnement pour Flask
ENV FLASK_APP=/opt/app.py

# Exposer le port 5000
EXPOSE 5000

# Commande pour exécuter Flask
CMD ["/opt/venv/bin/flask", "run", "--host=0.0.0.0", "--port=5000"]

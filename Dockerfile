# Verwende das offizielle Keycloak-Image als Basis
FROM quay.io/keycloak/keycloak:23.0.5

# Setze Umgebungsvariablen
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_SAMESITE="None"

# Lege das Verzeichnis für die Realm-Konfiguration fest
WORKDIR /opt/keycloak

# Kopiere die Realm-Konfigurationsdatei in den Container
COPY ./settings.json /opt/keycloak/data/import/settings.json

# Optional: Wenn du weitere Konfigurationen anpassen möchtest, kannst du hier eigene Scripte hinzufügen
# COPY ./custom-scripts /opt/keycloak/custom-scripts

# Setze die Startoptionen für den Realm-Import
# Die Option "--import-realm" sorgt dafür, dass die Realm-Konfiguration beim Starten importiert wird
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm"]
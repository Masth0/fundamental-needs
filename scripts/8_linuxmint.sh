#!/bin/env bash

. functions.sh

if asking_to_install "Disable cinnamon sounds effects? "; then
    # Démarrage de cinnamon
    gsettings set org.cinnamon.sounds login-enabled false

    # Fermeture de cinnamon
    gsettings set org.cinnamon.sounds logout-enabled false

    # Changement d'espace de travail
    gsettings set org.cinnamon.sounds switch-enabled false

    # Juxtaposition et attachement de fenêtre
    gsettings set org.cinnamon.sounds tile-enabled false

    # Insertion d'un péripherique
    gsettings set org.cinnamon.sounds plug-enabled false

    # Retait d'un péripherique
    gsettings set org.cinnamon.sounds unplug-enabled false
fi

if asking_to_install "Disable windows effects? "; then
    # Effets de fenêtres
    gsettings set org.cinnamon.muffin desktop-effects false
fi

if asking_to_install "Disable background? "; then
    # Pas de fond d'écran
    gsettings set org.cinnamon.desktop.background picture-options \'none\'
fi
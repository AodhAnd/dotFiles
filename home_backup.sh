#!/bin/bash
# This script is intended to run backups of relevant data under my home folder.
# It uses restic tool (written in Go, see: https://github.com/restic/restic) as
# a backend to save everything under /home/{user}, with the exception of some
# files, specified in a dedicated listing file. 
# A configuration is also set to choose a snapshot conservation policy (future feature).

USER=Aand

HDD_NAME=Åsgard
REPO_DIR=rivendell
LOCAL_DEST=/run/media/${USER}/${HDD_NAME}/Backups/${REPO_DIR}
# SFTP_URL=
# AWS_URL=

SAVE_FOLDER=/home/${USER}/
# An exclusion file must be located in the same folder as this script
EXCL_FILE=restic_exclude

TAG=rivendell_home
OPT=

echo "Checking integrity of previous snapshots..."
restic -r $LOCAL_DEST check

echo "Saving $SAVE_FOLDER folder into $LOCAL_DEST with tag $TAG..."
restic -r $LOCAL_DEST backup $SAVE_FOLDER --exclude-file=$EXCL_FILE --tag $TAG

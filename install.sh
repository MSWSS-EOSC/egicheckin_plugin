#!/bin/bash

#git clone https://github.com/MSWSS-EOSC/egicheckin_plugin

GALAXY_DIRECTORY="/home/export/galaxy-central"

mv  -v ./source/psa_authnz.py $GALAXY_DIRECTORY/lib/galaxy/authnz
chmod u=rw,g=rw,o=r $GALAXY_DIRECTORY/lib/galaxy/authnz/psa_authnz.py
mv  -v ./source/managers.py $GALAXY_DIRECTORY/lib/galaxy/authnz
chmod u=rw,g=rw,o=r $GALAXY_DIRECTORY/lib/galaxy/authnz/managers.py

mv  -v ./source/oidc_config.xml $GALAXY_DIRECTORY/config
chmod u=rwx,g=rwx,o=rwx $GALAXY_DIRECTORY/config/oidc_config.xml
mv  -v ./source/oidc_backends_config.xml $GALAXY_DIRECTORY/config
chmod u=rwx,g=rwx,o=rwx $GALAXY_DIRECTORY/config/oidc_backends_config.xml

mv  -v ./source/egi.py /home/export/galaxy_venv/lib/python3.8/site-packages/social_core/backends/
chmod u=rwx,g=rwx,o=rwx /home/export/galaxy_venv/lib/python3.8/site-packages/social_core/backends/egi.py

#echo 'enable_oidc: true' >> ${GALAXY_DIRECTORY}/config/galaxy.yml
#echo 'oidc_config_file: oidc_config.xml' >> ${GALAXY_DIRECTORY}/config/galaxy.yml
#echo 'oidc_backends_config_file: oidc_backends_config.xml' >> ${GALAXY_DIRECTORY}/config/galaxy.yml

#docker restart galaxy
docker exec galaxy supervisorctl restart galaxy:

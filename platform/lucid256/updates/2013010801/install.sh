#!/bin/bash
\rm /etc/cron.daily/drupal256update
ln -s /opt/drupal256/packages/drupal256update/drupal256update /etc/cron.hourly/

/opt/drupal256/platform/lucid256/updates/2013010801/01.install
/opt/drupal256/platform/lucid256/updates/2013010801/02.install
/opt/drupal256/platform/lucid256/updates/2013010801/03.install
cp /opt/drupal256/platform/lucid256/updates/2013010801/version /etc/drupal256/
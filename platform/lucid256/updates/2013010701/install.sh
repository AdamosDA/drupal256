#!/bin/bash
mkdir /etc/drupal256
echo lucid256 > /etc/drupal256/platform
echo 00000000  > /etc/drupal256/version
cp /opt/drupal256/packages/drupal256update/drupal256update /etc/drupal256
ln -s /etc/drupal256/drupal256update /etc/cron.daily/

/opt/drupal256/platform/lucid256/updates/2013010701/01.install
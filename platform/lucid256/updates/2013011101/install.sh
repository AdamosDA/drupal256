#!/bin/bash
/opt/drupal256/platform/lucid256/updates/2013011101/01.install
cp /opt/drupal256/platform/lucid256/updates/2013011101/01.ssigupdate  /etc/cron.hourly/ssigupdate
/etc/cron.hourly/ssigupdate
cp /opt/drupal256/platform/lucid256/updates/2013011101/version /etc/drupal256/
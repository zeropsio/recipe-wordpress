#!/bin/sh
wp plugin activate --all --allow-root
wp rewrite structure "/%postname%" --allow-root

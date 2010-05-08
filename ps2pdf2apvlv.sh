#! /bin/sh

ps2pdf $1 /tmp/${1%.ps}.pdf
apvlv /tmp/${1%.ps}.pdf

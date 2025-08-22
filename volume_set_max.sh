#!/bin/bash

amixer set Master 100%
amixer set PCM 100%

amixer set Master unmute
amixer set PCM unmute

sudo alsactl store
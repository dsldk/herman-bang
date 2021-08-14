#!/bin/bash

xmlstarlet sel -N tei="http://www.tei-c.org/ns/1.0" \
  -t -m "//tei:additional//tei:bibl[text()!='empty']" \
  -f -o " " -v "normalize-space(.)" -n "${@:--}"

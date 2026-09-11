#!/bin/bash
# Lance l'app en local sur le Mac (http://localhost:8890) et l'ouvre dans le navigateur.
cd "$(dirname "$0")"
open "http://localhost:8890"
python3 -m http.server 8890 >/dev/null 2>&1
